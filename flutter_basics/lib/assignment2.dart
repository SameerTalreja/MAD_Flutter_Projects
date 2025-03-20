import 'dart:async';

StreamController<String> controller = StreamController<String>.broadcast();

Stream<String> stream = controller.stream;

void main() {
  StreamSubscription<String> subscriber1 = stream.listen(
    (String data) {
      print('Student1: ${data}');
    },
    onError: (error) {
      print('Student1: ${error}');
    },
    onDone: () {
      print('Student1: Stream closed!');
    },
  );

  StreamSubscription<String> subscriber2 = stream.listen(
    (String data) {
      print('Student2: ${data}');
    },
    onError: (error) {
      print('Student2: ${error}');
    },
    onDone: () {
      print('Student2: Stream closed!');
    },
  );

  controller.sink.add('Sameer Talreja');

  controller.addError('Error!');

  controller.close();
}
