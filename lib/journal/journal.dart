import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import 'journalling.dart';

class JournalPage extends StatelessWidget {
  final List<String>? entries;

  JournalPage({this.entries});

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
              itemCount: entries?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(entries![index]), // Use ! to assert non-null (assuming you're sure it won't be null)
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate back to JournallingPage
          Navigator.pop(context);
        },
        backgroundColor: AppColors.secondaryblue,
        child: Icon(Icons.add),
      ),
    );
  }


  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Journal',
        style: TextStyle(
            color: AppColors.secondaryblue,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {

        },
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
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    );
  }
}

