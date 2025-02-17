import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily English Practice',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DailyWordScreen(),
    );
  }
}

class DailyWordScreen extends StatefulWidget {
  const DailyWordScreen({super.key});

  @override
  _DailyWordScreenState createState() => _DailyWordScreenState();
}

class _DailyWordScreenState extends State<DailyWordScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int currentIndex = 0;

  // Replace with your actual words and sentences list
  final List<Map<String, String>> wordsAndSentences = [
    // Vocabulary Words
    {
      "word": "Resilient",
      "meaning":
          "Able to withstand or recover quickly from difficult conditions.",
      "example":
          "Despite losing her job, Emily remained resilient and started her own business."
    },
    {
      "word": "Eloquent",
      "meaning": "Fluent or persuasive in speaking or writing.",
      "example": "His speech was eloquent and inspiring."
    },
    {
      "word": "Apathetic",
      "meaning": "Showing or feeling no interest, enthusiasm, or concern.",
      "example":
          "His co-workers appeared to be quite apathetic and didn’t share his enthusiasm."
    },
    {
      "word": "Sincere",
      "meaning": "Free from pretence or deceit; genuine.",
      "example":
          "Our new manager is sincere and very straightforward with his expectations."
    },
    {
      "word": "Vulnerable",
      "meaning": "Susceptible to physical or emotional harm.",
      "example":
          "Her partner, Richard, was emotionally vulnerable and found it hard to adjust to the new challenges."
    },
    {
      "word": "Optimistic",
      "meaning": "Hopeful and confident about the future.",
      "example":
          "Despite the setbacks, Roen remained optimistic about the project's success."
    },
    {
      "word": "Generous",
      "meaning":
          "Willing to give more of something, especially money or time, than is strictly necessary or expected.",
      "example":
          "My mum is very generous, always volunteering and donating to charity."
    },
    {
      "word": "Persistent",
      "meaning":
          "Continuing firmly or obstinately in a course of action in spite of difficulty or opposition.",
      "example":
          "Though Raul and his kids had never built a treehouse, they remained persistent in their efforts."
    },

    // Special Sentences with Numbers
    {
      "sentence": "Tough times don’t last, but **resilient** people do.",
      "meaning":
          "Challenges are temporary, but those who endure them become stronger."
    },
    {
      "sentence": "Simplicity is the **ultimate sophistication**.",
      "meaning": "Even complex ideas can be best expressed in simple ways."
    },
    {
      "sentence":
          "A pessimist sees the **difficulty in every opportunity**; an optimist sees the **opportunity in every difficulty**.",
      "meaning":
          "Optimistic people focus on possibilities even in tough situations."
    },
    {
      "sentence":
          "True **strength** is showing your **vulnerabilities** without fear.",
      "meaning": "Being open about weaknesses is a sign of emotional strength."
    },
    {
      "sentence": "**Honesty** without tact is **cruelty**.",
      "meaning":
          "Being truthful is important, but it should be done with sensitivity."
    },
    {
      "sentence":
          "**Consistency** is the key to success, not **erratic efforts**.",
      "meaning":
          "Regular and steady work brings success rather than random efforts."
    },
    {
      "sentence": "The **deeper the roots, the stronger the tree**.",
      "meaning": "Strong foundations lead to lasting success or resilience."
    },
    {
      "sentence": "A **robust system** is one that thrives under pressure.",
      "meaning": "True strength is revealed in difficult circumstances."
    },
    {
      "sentence": "**Clarity** is power.",
      "meaning":
          "Being clear and logical in thoughts and communication brings strength."
    },
    {
      "sentence": "**Perfection** is an illusion, but **improvement** is real.",
      "meaning":
          "No one is truly perfect, but we can always strive to be better."
    },
    {
      "sentence": "**Speak of the devil**, we were just talking about you!",
      "meaning": "Used when someone appears just after being mentioned."
    },
    {
      "sentence": "You’re **in for a treat**.",
      "meaning": "Something enjoyable is about to happen."
    },
    {
      "sentence": "Let me **have a think**.",
      "meaning": "A polite way to say 'I need time to decide'."
    },
    {
      "sentence": "Are you **free on…?**",
      "meaning": "A polite way to ask someone’s availability for an event."
    },
    {
      "sentence": "Do you **fancy** going out for a bite to eat?",
      "meaning": "A casual way to ask someone if they want to do something."
    },
    {
      "sentence": "We’ve got so much to **catch up on**.",
      "meaning":
          "A way to say you have a lot to discuss with someone after not seeing them for a while."
    },
    {
      "sentence": "What **gets you out of bed** in the morning?",
      "meaning": "A way to ask about someone's motivation or passion."
    },
    {
      "sentence": "We should **discuss this over lunch**.",
      "meaning":
          "A way to suggest talking about something in a relaxed setting."
    },
    {
      "sentence": "Right, I **need to make a move**.",
      "meaning": "A polite way to indicate you are leaving."
    },
    {
      "sentence": "I don’t want to **hog you**, so I’m going to go over here.",
      "meaning":
          "A polite way to leave a conversation while making the other person feel valued."
    },
    {
      "sentence": "I’ve already taken **so much of your time**.",
      "meaning":
          "A polite way to end a conversation while appreciating the person’s time."
    },
    {
      "sentence": "**Play it by ear**.",
      "meaning":
          "To decide how to deal with a situation as it develops, rather than planning in advance."
    },
    {
      "sentence": "I’m **not sure about that**.",
      "meaning": "A polite way to express doubt or disagreement."
    },
    {
      "sentence": "To **get the ball rolling**.",
      "meaning": "To start something, especially a process or activity."
    },
    {
      "sentence": "To **call it a night**.",
      "meaning": "To stop an activity and go home, usually in the evening."
    },
    {
      "sentence": "I need a little **lie-down**.",
      "meaning": "To rest, either physically or because of shock or stress."
    },
    {
      "sentence": "Bear **in mind** that…",
      "meaning": "A way to remind someone to consider an important fact."
    },
    {
      "sentence": "The food was **out of this world**.",
      "meaning": "Something is exceptionally good or amazing."
    },
    {
      "sentence": "I’m **over the moon**.",
      "meaning": "Extremely happy and excited."
    }
  ];

  @override
  void initState() {
    super.initState();
    _loadDailyWord();
    _initializeNotifications();
    _scheduleDailyNotification();
  }

  Future<void> _loadDailyWord() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();
    final String todayKey = "${now.year}-${now.month}-${now.day}";

    if (!prefs.containsKey("last_seen_day") ||
        prefs.getString("last_seen_day") != todayKey) {
      setState(() {
        currentIndex = now.day % wordsAndSentences.length;
      });
      prefs.setString("last_seen_day", todayKey);
      prefs.setInt("currentIndex", currentIndex);
    } else {
      setState(() {
        currentIndex = prefs.getInt("currentIndex") ?? 0;
      });
    }
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> _scheduleDailyNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'daily_word_id',
      'Daily Word',
      channelDescription: 'Daily word notification',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Daily English Word & Sentence',
      _getNotificationContent(),
      _nextInstanceOfTenAM(),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  String _getNotificationContent() {
    var item = wordsAndSentences[currentIndex];
    if (item.containsKey("word")) {
      return "Word: ${item["word"]}\nMeaning: ${item["meaning"]}";
    } else {
      return "Sentence: ${item["sentence"]}\nMeaning: ${item["meaning"]}";
    }
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  @override
  Widget build(BuildContext context) {
    var item = wordsAndSentences[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Practice Card')),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (item.containsKey("word"))
                    Text(item["word"]!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  if (item.containsKey("sentence"))
                    Text(item["sentence"]!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text(item["meaning"]!,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                  if (item.containsKey("example")) ...[
                    const SizedBox(height: 10),
                    Text("Example: ${item["example"]!}",
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Button Pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WordsListScreen(
                              wordsAndSentences: wordsAndSentences),
                        ),
                      );
                    },
                    child: const Text('Show List'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WordsListScreen extends StatelessWidget {
  final List<Map<String, String>> wordsAndSentences;

  const WordsListScreen({super.key, required this.wordsAndSentences});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Word & Sentence List")),
      body: ListView.builder(
        itemCount: wordsAndSentences.length,
        itemBuilder: (context, index) {
          var item = wordsAndSentences[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            child: ListTile(
              title: Text(item.containsKey("word")
                  ? "Word: ${item["word"]}"
                  : "Sentence: ${item["sentence"]}"),
              subtitle: Text(item["meaning"]!),
            ),
          );
        },
      ),
    );
  }
}
