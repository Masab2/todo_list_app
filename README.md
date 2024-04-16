# Todo List App with Hive Database

This Todo List App is built using Flutter and utilizes Hive database for data storage. It follows the MVVM (Model-View-ViewModel) architecture pattern for better separation of concerns and maintainability.

## Features

- View, add, edit, and delete todo items.
- Mark todo items as completed.
- Persistence of todo items using Hive database.
- Simple and intuitive user interface.

## Dependencies

- **Flutter**: A cross-platform UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Hive**: A lightweight and fast key-value database written in pure Dart, used for local data storage in Flutter apps.
- **Getx**: A state management library for Flutter applications, used to implement MVVM architecture.
- **intl**: A Flutter package for internationalizing and localizing Flutter applications.

## Architecture

The Todo List App is structured using the MVVM (Model-View-ViewModel) architecture pattern, which separates the concerns of data, presentation, and logic:

- **Model**: Represents the data entities and business logic of the application.
- **View**: Represents the UI components and their layout.
- **ViewModel**: Acts as a bridge between the Model and View, responsible for managing the presentation logic and state of the UI.

## Installation and Setup

To run the Todo List App:

1. Install Flutter SDK on your system.
2. Clone this repository.
3. Navigate to the project directory.
4. Run `flutter pub get` to install dependencies.
5. Run the app on an emulator or a physical device using `flutter run`.

## Usage

1. Launch the app on your device.
2. View the list of existing todo items.
3. Add a new todo item by tapping on the '+' button.
4. Edit or delete existing todo items by tapping on them.
5. Mark todo items as completed by tapping on the checkbox.
6. Changes to todo items are automatically saved to the Hive database.

## Credits

- This project is developed by Masab Haider

