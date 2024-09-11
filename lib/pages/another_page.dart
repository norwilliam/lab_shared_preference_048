import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'first_page.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? myName;

  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("name");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .remove("name"); // Remove the data associated with the key "name"
    // Clear the myName variable and update UI
    setState(() {
      myName = null;
    });
    // Show a SnackBar to inform the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ข้อมูลถูกลบแล้ว')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Another Page 📊",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 8,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Show Your name
              Text(
                myName ?? "รอสักครู่",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
              SizedBox(height: 20),
              // Button go to Another Page
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                  child: Text(
                    'ย้อนกลับไปหน้าแรก 📄',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                  child: Text(
                    'ย้อนกลับไปหน้าHome 🏠',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  removeData();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.redAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Text(
                    'ลบข้อมูลชื่อ ❎',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
