import 'package:flutter/material.dart';
import 'listen_quran.dart'; // ✅ استيراد صفحة الاستماع للقرآن بعد تعديل الاسم
import 'read_book_screen.dart'; // ✅ تم تصحيح اسم الملف

class TreatmentSuggestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let’s improve your mood",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildOption(context, "assets/images/quran.png", isQuran: true),
                  buildOption(context, "assets/images/book.png", isBook: true), // ✅ إضافة التنقل إلى صفحة قراءة الكتب
                  buildOption(context, "assets/images/videos.png"),
                  buildOption(context, "assets/images/broadcast.png"),
                  buildOption(context, "assets/images/relaxation.png"),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 382,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  // Action for End Session button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9616FF),
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "End Session",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 21),
          ],
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, String imagePath, {bool isQuran = false, bool isBook = false}) {
    return GestureDetector(
      onTap: () {
        if (isQuran) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListenQuran()), // ✅ التأكد من أن الكلاس مستدعى بشكل صحيح
          );
        } else if (isBook) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReadBooksScreen()),
          );

        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
