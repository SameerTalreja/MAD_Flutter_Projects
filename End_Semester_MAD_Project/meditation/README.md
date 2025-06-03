# Meditation App

A modern Flutter-based meditation app designed to help users relax, focus, and improve their mindfulness. This project demonstrates best practices in Flutter development, clean architecture, and beautiful UI/UX.

## Project Overview

The Meditation App provides guided meditation sessions, calming sounds, and progress tracking to support users on their mindfulness journey. With a clean interface and smooth navigation, users can easily explore meditation exercises, set reminders, and monitor their progress.

## Features

- 🧘 Guided meditation sessions for various goals (relaxation, focus, sleep)
- 🎵 Calming background sounds and music
- 📅 Progress tracking and daily streaks
- ⏰ Customizable reminders for meditation sessions
- 🌙 Light and dark mode support
- 🔒 Secure local storage for user data
- 🚀 Fast, responsive, and cross-platform (Android & iOS)
- 🔑 Google Sign-In and Firebase Authentication

## Tools and Technologies Used

- **Flutter**: Cross-platform mobile app development
- **Dart**: Programming language for Flutter
- **cupertino_icons**: iOS-style icons
- **flutter_staggered_grid_view**: Advanced grid layouts for beautiful UI
- **firebase_core**: Core Firebase integration
- **firebase_auth**: User authentication with Firebase
- **google_sign_in**: Google account sign-in
- **just_audio**: Audio playback for meditation sounds

## Code Structure

The project follows a clean and modular structure, inspired by the **MVVM (Model-View-ViewModel)** design pattern for better separation of concerns and maintainability:

```
lib/
│
├── models/         # Data models (e.g., MeditationSession, User)
├── views/          # UI screens and widgets
├── viewmodels/     # Business logic and state management
├── services/       # Data services (e.g., storage, notifications, audio)
├── utils/          # Utility functions and constants
└── main.dart       # App entry point
```

- **Models**: Define the structure of data used in the app.
- **Views**: Contain all UI components and screens.
- **ViewModels**: Manage state and business logic, connecting models and views.
- **Services**: Handle data storage, authentication, audio playback, and external integrations.

## Getting Started

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd meditation
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Run the app:**
   ```
   flutter run
   ```

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements and bug fixes.

## License

This project is licensed under the MIT License.

---

For more information on Flutter, check out the [official documentation](https://docs.flutter.dev/).
