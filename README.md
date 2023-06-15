<p align="center">
  <a href="https://play.google.com/store/apps/details?id=com.adrianbugala.my_books">
    <img src="https://github.com/AdrianBugala/books/blob/master/media/download_banner.jpg" width=100% height=100%>
  </a>
</p>

# My Books
My Books is an app that allows users to track their reading progress. With a simple interface, users can add books they are currently reading. After adding a book to their library, users can enter the number of pages read, and the app calculates the completion percentage, helping users track their progress.

<p align="center">
<img src="https://github.com/AdrianBugala/books/blob/master/media/my%20books%20GIF.gif" width=35% height=35%>
</p>

### Running the project

Before running, see instructions on how to [configure project with Firebase](#configure-project-with-firebase).

## App Overview

The application is composed by three primary screens: **Books**, **Quote of the day** and **Profile**.

On first launch, the app asks the user to create a profile. 

The **Books** page loads a list of books from the Firebase Database. Results are listed from newest to oldest. On this page, users can also add a new book by tapping the "add" button and then filling in the fields.
Each book includes a poster, title, author, number of pages, description, and comment, which can be edited. Each book can also be deleted.

The main functionality of the app is to track reading progress. After a reading session, users can add the current page to their reading history, and the app will calculate the current reading status and present it to the user using a progress indicator.

The **Quote of the day** page displays a random quote fetched from a "quotes" API interface and aims to motivate the user to read.

The **Profile** page allows users to update their information, log out, or delete their account.

## Packages in use

The "core" package of the app uses the following packages:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management 
- [firebase_core](https://pub.dev/packages/firebase_core) for app integration with Firebase environment
- [dio](https://pub.dev/packages/dio) for the API client
- [retrofit](https://pub.dev/packages/retrofit) for Dio improvement
- [freezed](https://pub.dev/packages/freezed) for code improvement
- [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable) for better app maintenance

# Roadmap
My Books is an ever-evolving application that provides users with convenient tools to track their progress in reading books. My goal is to deliver features that will enhance users' reading experience. Here is a roadmap outlining several key functionalities that I am currently working on.
#### 📂 Independent folders for 'Now Reading', 'Read', and 'Wishlist' 📂
Allows users to easily sort and organize books, distinguishing between books they are currently reading, those they have read, and those they wish to read in the future.
#### ⭐ Star rating and favorite screen ⭐
Enables users to rate books with stars and creates a dedicated screen to showcase their favorite titles.
#### 📉 Overall chart with reading progress 📈
Provides users with an overview of their reading journey by presenting a chart (displaying the number of books read, number of pages read etc. over time.)
#### 🧑‍💻 User profile improvement 🧑‍💻
Enhances the user profile with features that allow customization and easy updating of personal information.
#### 📷 Adding book covers with phone camera 📷
Enables users to capture and add book covers using their phone's camera.
#### 📨 Push notifications 📨
Implements push notifications to remind users about reading goals, track progress, and encourage consistent reading habits.

# Configure project with Firebase

### Change App ID:
Find and replace any occurance of `com.adrianbugala` to `com.yourcompanyname`

### Configure Firebase in your system:

- [Install Firebase CLI](https://firebase.google.com/docs/cli)

- Login to your Google Account where you want to store data of a project:
```
firebase login
```

- Install the CLI if not already done so:
```
dart pub global activate flutterfire_cli
```

- Run the `configure` command, select a Firebase project and platforms:
```
flutterfire configure
```

### Configure Firebase project

Log in to your [Firebase Account](https://console.firebase.google.com/) 

1. Enable Authentication > Email/Password Provider 
2. Create Cloud Firestore database.

