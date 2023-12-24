import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String quote = '';

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    try {
      final response = await http.get(
        Uri.parse('https://famous-quotes4.p.rapidapi.com/random?category=all&count=1'),
        headers: {
          'X-RapidAPI-Key': 'fb3477a566mshc1dde9b3caee813p163f63jsne69794155513',
          'X-RapidAPI-Host': 'famous-quotes4.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        if (jsonData.isNotEmpty) {
          final quoteContent = jsonData[0]['text'];
          setState(() {
            quote = quoteContent is String ? quoteContent : 'Failed to load quote';
          });
        } else {
          throw Exception('Empty data');
        }
      } else {
        throw Exception('Failed to load quote - ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to load quote');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote.isNotEmpty ? '"$quote"' : 'Loading...',
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
