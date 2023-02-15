# App Flutter with api Php

This Flutter application connects to an API in PHP and uses a MySQL database to store the data. The objective of this application is to make a connection of a user but also the creation of a user.

## How to use the application

### Requirements

To use this application locally, you must:

- Have a recent version of Flutter installed on your computer
- Have a MySQL server installed and configured on your computer

### Installation

1. Clone the GitHub repository:
```
git clone https://github.com/1ke4real/flutter_php_login.git
```

2. Install the dependencies by running the following command:
```
flutter pub get
```
3. Create a MySQL database named `testdb`: with a `testuser` table

4. Start the server

5. Start the application by running the following command:
```
flutter run
```

### Details

To connect the application to the server it will be necessary to modify the files `login.dart` and `create_user.dart` found in `lib\service` in order to enter the good information for the connection to the api PHP and also the files php for the connection to the data base.

If you want a screenshot of application go to the `screenshot` folder