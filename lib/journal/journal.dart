import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import 'journalling.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<String> journalEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'List of Journal Entries:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryblue,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondaryblue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _getEmoji(journalEntries[index]), // Display emoji
                          style: TextStyle(fontSize: 20), // Font size for emoji
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _getNoteText(journalEntries[index]), // Display note text
                            style: TextStyle(fontFamily: 'Poppins'), // Set font to Poppins
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final updatedEntries = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JournallingPage()),
          );
          if (updatedEntries != null) {
            setState(() {
              journalEntries = List.from(updatedEntries);
            });
          }
        },
        backgroundColor: AppColors.secondaryblue,
        child: Icon(Icons.add),
      ),
    );
  }

  String _getEmoji(String entry) {
    // Extracts the emoji from the entry
    List<String> parts = entry.split(' - ');
    // Replace text representation with emoji
    switch (parts[0]) {
      case 'sad':
        return '😢';
      case 'neutral':
        return '😐';
      case 'happy':
        return '😊';
      case 'very happy':
        return '😄';
      case 'excited':
        return '😃';
      default:
        return '';
    }
  }

  String _getNoteText(String entry) {
    // Extracts the note text from the entry
    List<String> parts = entry.split(' - ');
    return parts[1];
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Journal',
        style: TextStyle(
          color: AppColors.secondaryblue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
