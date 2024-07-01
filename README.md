# viral_post

This project is a Flutter application designed to manage posts (title and description) using Firebase Firestore.
The app includes functionalities for listing, creating, and updating posts. It supports real-time updates and is compatible with both Android and iOS platforms.

## Features

- **List of Posts**: Displays a list of posts retrieved from Firestore.
- **Post Details**: Shows detailed information about a post and allows editing.
- **Create New Post**: Provides an interface to add a new post.
- **Floating Action Button**: A button to quickly navigate to the creation page.
- **State Management**: Handles various states (empty, success, error, loading) for data operations.
- **Real-time Updates**: Synchronizes data changes in real-time.

## Firebase Setup

### Crashlytics
Crashlytics is set up to monitor and report crashes in real-time.

### Firestore
Firestore is used for storing and retrieving posts.

## Architecture

### Patterns Used
- **BloC Pattern**: Ensures a clear separation between business logic and UI.
- **Repository Pattern**: Manages data operations and interactions with Firestore.

## Requirements

- **Flutter Version**: 3.19.1 or higher
- **Dart SDK**: Compatible version with Flutter 3.19.1

## Getting Started

Follow these steps to get the project running on your local machine:

1. **Clone the repository**
   ```sh
   git clone <your_repository_url>
   
2. **Navigate to the project directory**
   ```sh
    cd <your_project_directory>
   
3. **Install dependencies**
   ```sh
   flutter pub get
   
4. **Run the app**
   ```sh
    flutter run
