# daily_task_manager

A simple Flutter application that performs CRUD (Create, Read, Update, Delete) operations using a public REST API with Provider state management and the HTTP package.

#  Features

-  Fetch tasks from API (Read)
-  Add new task (Create)
-  Update task (Update)
-  Delete task (Delete)
-  Loading states
-  Error handling


# Project Structure

lib/
│
├── models/
│   └── task.dart
│
├── services/
│   └── api_service.dart
│
├── providers/
│   └── task_provider.dart
│
├── screens/
│   ├── home_screen.dart
│   └── add_task_screen.dart
│
├── widgets/
│   └── task_tile.dart
│
└── main.dart

---

#  Screenshots

##  Home Screen

![Home Screen](assets/screenshots/get_task.png)

---

##  Add Task Screen

![Add Expense](assets/screenshots/add_task.png)

---

##  Update Task Screen

![Update Expense](assets/screenshots/edit_task.png)
![Update Expense](assets/screenshots/updated_task.png)

---

##  Delete Task Action
![Delete Expense](assets/screenshots/delete_task.png)
