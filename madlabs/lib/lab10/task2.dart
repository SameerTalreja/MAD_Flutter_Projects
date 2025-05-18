import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedScreen(),
    );
  }
}

class FeedScreen extends StatefulWidget {
  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UploadScreen()),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          final posts = snapshot.data!.docs;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: GestureDetector(
                    onLongPress: () async {
                      await _downloadImage(post['imageUrl'], context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        post['imageUrl'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(post['title'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(post['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdateScreen(
                              postId: post.id,
                              title: post['title'],
                              description: post['description'],
                              imageUrl: post['imageUrl'],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _showDeleteDialog(
                            context, post.id, post['imageUrl']),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _downloadImage(String imageUrl, BuildContext context) async {
    try {
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse(imageUrl));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);

      final dir = await getExternalStorageDirectory();
      final fileName = path.basename(imageUrl.split('?').first);
      final file = File('${dir!.path}/$fileName');
      await file.writeAsBytes(bytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image downloaded successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download image')),
      );
    }
  }

  void _showDeleteDialog(BuildContext context, String postId, String imageUrl) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Post'),
        content: Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('posts')
                  .doc(postId)
                  .delete();
              await FirebaseStorage.instance.refFromURL(imageUrl).delete();
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}

class UploadScreen extends StatefulWidget {
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  XFile? _image;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _image = picked);
  }

  Future<void> _uploadPost() async {
    if (_titleController.text.isEmpty ||
        _descController.text.isEmpty ||
        _image == null) return;
    setState(() => _isUploading = true);

    final ref = FirebaseStorage.instance.ref(
        'posts/${DateTime.now().millisecondsSinceEpoch}_${path.basename(_image!.path)}');
    await ref.putFile(File(_image!.path));
    final imageUrl = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('posts').add({
      'title': _titleController.text,
      'description': _descController.text,
      'imageUrl': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() => _isUploading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Post')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 12),
            _image != null
                ? Image.file(File(_image!.path), height: 180, fit: BoxFit.cover)
                : Container(
                    height: 180,
                    color: Colors.grey[200],
                    child: Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text('Select Image'),
              onPressed: _pickImage,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: _isUploading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Upload'),
              onPressed: _isUploading ? null : _uploadPost,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateScreen extends StatefulWidget {
  final String postId, title, description, imageUrl;
  UpdateScreen(
      {required this.postId,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  XFile? _image;
  bool _isUpdating = false;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descController = TextEditingController(text: widget.description);
    _imageUrl = widget.imageUrl;
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _image = picked);
  }

  Future<void> _updatePost() async {
    setState(() => _isUpdating = true);
    String imageUrl = _imageUrl!;
    if (_image != null) {
      await FirebaseStorage.instance.refFromURL(_imageUrl!).delete();
      final ref = FirebaseStorage.instance.ref(
          'posts/${DateTime.now().millisecondsSinceEpoch}_${path.basename(_image!.path)}');
      await ref.putFile(File(_image!.path));
      imageUrl = await ref.getDownloadURL();
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .update({
      'title': _titleController.text,
      'description': _descController.text,
      'imageUrl': imageUrl,
    });
    setState(() => _isUpdating = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Post')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 12),
            _image != null
                ? Image.file(File(_image!.path), height: 180, fit: BoxFit.cover)
                : Image.network(_imageUrl!, height: 180, fit: BoxFit.cover),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text('Change Image'),
              onPressed: _pickImage,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: _isUpdating
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Update'),
              onPressed: _isUpdating ? null : _updatePost,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }
}
