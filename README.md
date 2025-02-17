# Daily English Practice App

🚀 A simple **Flutter app** that helps users learn a new English word every day with example sentences and meanings. The app also sends daily notifications to remind users about their word of the day.

## 📱 Features

- 📌 **Daily Word**: Automatically displays a new word and its meaning every day.
- 🔔 **Daily Notifications**: Sends a notification with the daily word.
- 📖 **Word List**: View all words and their meanings in a list.
- 💾 **Local Storage**: Saves the last accessed word using `shared_preferences`.

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **flutter_local_notifications** (For notifications)
- **shared_preferences** (For local storage)

## 📸 Screenshots

| Daily Word | Word List |
|------------|------------|
| 📷 *[Insert Screenshot]* | 📷 *[Insert Screenshot]* |

## 📦 Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/daily-practice-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd daily-practice-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## 🏗️ Project Structure

```bash
lib/
├── main.dart          # Main entry point
├── home_screen.dart   # Displays daily word and notifications
├── words_list.dart    # List of all words with meanings
└── services/
    ├── notification_service.dart  # Manages notifications
    └── storage_service.dart       # Handles shared preferences
```

## 🔔 How Notifications Work
- Notifications are scheduled every day at **9:00 AM**.
- If the app is restarted, notifications are rescheduled automatically.

## 📜 License
This project is licensed under the MIT License.

## 🙌 Contributing
Feel free to fork the repository and submit a pull request with improvements.

## 📬 Contact
For any queries, reach out to me at [your.email@example.com](mailto:your.email@example.com).

