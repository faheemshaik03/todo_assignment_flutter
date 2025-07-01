#  ToDoList Flutter App

A cross-platform ToDoList app built with Flutter and GetX for Quantum IT Innovation's assignment.

##  Features

-  Add, edit, delete tasks
-  Set due dates and task priority (High, Medium, Low)
-  Local push notifications for reminders
-  Persistent storage using Hive (offline-safe)
-  Sort by priority, due date, or creation date
-  Search tasks by title or keyword
-  Material Design-compliant UI
-  MVVM architecture using GetX

##  Tech Stack

- **Flutter** & **Dart**
- **GetX** (State Management & Routing)
- **Hive** (Local NoSQL storage)
- **flutter_local_notifications** (Push notifications)
- **MVVM Architecture**

##  How to Run

```bash
git clone https://github.com/faheemshaik03/todo_assignment_flutter.git
cd todo_assignment_flutter
flutter pub get
flutter run -d emulator-5554  # or your connected device




##  Author

Faheem Shaik  
[GitHub](https://github.com/faheemshaik03)

##  APK link

[Download APK](https://drive.google.com/file/d/1sJ9E6PNoyCVnYPVtya7CIeNcLcy-_d5q/view?usp=sharing)


##  Demo Video

 [Watch Demo Video](https://drive.google.com/file/d/1xWw-Kam7V_AOinoYFwWySCsC2yiswyUh/view?usp=sharing)


## 🧠 Thought Process & Design Decisions

This ToDoList app was designed with simplicity, performance, and usability in mind:

- **State Management:** I chose **GetX** for efficient state handling and routing, which ensures fast performance and clean separation of UI and logic.
- **Architecture:** The app follows the **MVVM (Model-View-ViewModel)** pattern to keep logic and UI separate for maintainability and scalability.
- **Data Persistence:** I used **Hive** to store tasks locally, even when the app is closed or restarted.
- **Notifications:** The app uses **flutter_local_notifications** to alert users about upcoming tasks.
- **UI/UX:** Built with **Material Design** principles for a clean and intuitive interface.
- **Features Covered:**
  - Add, Edit, Delete Tasks
  - Task Priority and Due Date
  - Search and Sort
  - Local Notifications
  - Offline Data Storage

This project showcases my understanding of Flutter, clean code practices, and building user-focused apps.
