import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipd/colors.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<List<String>> _answers = List.filled(11, []);
  double _sliderValue = 5.0;

  void _nextPage() {
    if (_currentPage < 10) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildQuestion('Your current class level is:', ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate student', 'Other']),
                  _buildQuestion('Your gender is:', ['Female', 'Male', 'Other / I prefer not to respond']),
                  _buildQuestionWithSlider('How stressed do you feel on a daily basis during the academic year?'),
                  SingleChildScrollView(
                    child: _buildMultiChoiceQuestion('What are the usual causes of stress in your life?', [
                      'Studies issues', 'Financial issues', 'Family issues', 'Friends issues', 'Issues with the significant other (partner)', 'Work (job-related) issues', 'Health Related Issues', 'Sports / Athletics activities issues', 'My involvement in clubs and organizations', 'Other',
                    ]),
                  ),
                  SingleChildScrollView
                    (child:_buildMultiChoiceQuestion('What are the usual BEHAVIORAL effects of stress you\'ve noticed at yourself?', [
                    'Change in activity levels', 'Decreased efficiency and effectiveness', 'Difficulty communicating', 'Increased sense of humor/gallows humor', 'Irritability, outbursts of anger, frequent arguments', 'Inability to rest, relax or let down', 'Change in eating habits', 'Change in sleep patterns', 'Change in activity performance', 'Periods of crying', 'Increased use of tobacco, alcohol, drugs, sugar or caffeine', 'Hyper-vigilance about safety or the surrounding environment', 'Avoidance of activities or places that trigger memories', 'Accident prone', 'Other',
                  ]),
                  ),
                  SingleChildScrollView(
                    child: _buildMultiChoiceQuestion('What are the usual PSYCHOLOGICAL or EMOTIONAL effects of stress you\'ve noticed at yourself?', [
                      'Feeling heroic, euphoric or invulnerable', 'Denial', 'Anxiety or fear', 'Worry about safety of self or others', 'Irritability or anger', 'Restlessness', 'Sadness, moodiness, grief or depression', 'Vivid or distressing dreams', 'Guilt or "survivor guilt"', 'Feeling overwhelmed, helpless or hopeless', 'Feeling isolated, lost, lonely or abandoned', 'Apathy', 'Over-identification with survivors', 'Feeling misunderstood or unappreciated', 'None of the Above', 'Other',
                    ]),
                  ),
                  SingleChildScrollView(
                    child: _buildMultiChoiceQuestion('What are the usual COGNITIVE effects of stress you\'ve noticed at yourself?', [
                      'Memory problems/forgetfulness', 'Disorientation', 'Confusion', 'Slowness in thinking, analyzing, or comprehending', 'Difficulty calculating, setting priorities or making decisions', 'Difficulty Concentrating', 'Limited attention span', 'Loss of objectivity', 'Inability to stop thinking about the disaster or an incident', 'None of the Above', 'Other',
                    ]),
                  ),
                  SingleChildScrollView(
                    child:_buildMultiChoiceQuestion('What are the usual SOCIAL effects of stress you\'ve noticed at yourself?', [
                      'Withdrawing or isolating from people', 'Difficulty listening', 'Difficulty sharing ideas', 'Difficulty engaging in mutual problem solving', 'Blaming', 'Criticizing', 'Intolerance of group process', 'Difficulty in giving or accepting support or help', 'Impatient with or disrespectful to others', 'None of the Above', 'Other',
                    ]),
                  ),
                  SingleChildScrollView(
                    child: _buildMultiChoiceQuestion('What are your personal methods to relieve stress?', [
                      'Eating', 'Sleeping', 'Drinking', 'Drugs', 'Sports / Exercise', 'Talking with someone', 'Shopping', 'Computer Games', 'Social Media', 'None of the Above', 'Other',
                    ]),
                  ),
                  _buildQuestionWithSlider('How able do you feel to handle stress when you are experiencing it?'),
                  SingleChildScrollView(
                    child: _buildMultiChoiceQuestion('What are the most pressing stress factors in your current academic context (related to this program of study)?', [
                      'Study workload', 'Grades', 'Financial pressure (e.g. tuition, living costs)', 'Work (and Study) - Life balance', 'Relationship with (some) faculty members', 'Relationship with other students', 'Campus social life', 'Other',
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: Text('Previous'),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.secondaryblue, // button color
                      onPrimary: Colors.white, // text color
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 10 || _answers[_currentPage].isNotEmpty) {
                      _nextPage();
                      if (_currentPage == 10) {
                        _submitAnswers();
                      }
                    }
                  },
                  child: Text(_currentPage == 10 ? 'Submit' : 'Next'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.secondary, // button color
                    onPrimary: Colors.white, // text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(String question, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options
              .map((option) => RadioListTile(
            title: Text(option),
            value: option,
            groupValue: _answers[_currentPage].isNotEmpty ? _answers[_currentPage].first : null,
            onChanged: (value) {
              setState(() {
                _answers[_currentPage] = [value!];
              });
            },
          ))
              .toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildQuestionWithSlider(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text('1'),
            Expanded(
              child: Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                onChangeEnd: (value) {
                  _answers[_currentPage] = [value.toString()];
                },
                min: 1,
                max: 10,
                divisions: 9,
              ),
            ),
            Text('10'),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMultiChoiceQuestion(String question, List<String> options) {
    List<String> selectedOptions = _answers[_currentPage];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options
              .map((option) => CheckboxListTile(
            title: Text(option),
            value: selectedOptions.contains(option),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
                _answers[_currentPage] = selectedOptions;
              });
            },
          ))
              .toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _submitAnswers() async {
    // Show loading screen
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing dialog with tap
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(), // Show circular progress indicator
        );
      },
    );

    // Delay for 3 seconds
    Future.delayed(Duration(seconds: 3), () async {
      // After 3 seconds, calculate stress level
      double stressLevelValue = conductQuestionnaire(_answers);
      int stressLevel = stressLevelValue.round();
      print("Stress Level: $stressLevelValue");

      String imagePath; // Variable to hold the image asset path

      switch (stressLevel) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
          imagePath = 'assets/images/image_one.png';
          break;
        case 6:
          imagePath = 'assets/images/image_two.png';
          break;
        case 7:
          imagePath = 'assets/images/image_three.png';
          break;
        case 8:
          imagePath = 'assets/images/image_four.png';
          break;
        case 9:
          imagePath = 'assets/images/image_five.png';
          break;
        default:
          imagePath = 'assets/images/image_one.png';
      }

      // Convert nested arrays to strings
      List<String> flattenedAnswers = _answers.map((list) => list.join(',')).toList();

      // Save flattened answers and timestamp to Firestore
      try {
        CollectionReference answersCollection =
        FirebaseFirestore.instance.collection('answers');
        await answersCollection.add({
          'answers': flattenedAnswers,
          'timestamp': Timestamp.now(),
          'stresslevel': stressLevelValue
        });
      } catch (e) {
        print("Error saving answers: $e");
      }

      // Dismiss loading screen dialog
      Navigator.pop(context);

      // Show image based on stress level
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageScreen(imagePath: imagePath),
        ),
      );
      print(stressLevelValue);
    });
  }


  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Bliss Bot',
        style: TextStyle(color: AppColors.secondaryblue, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
              color: Colors.black,
            ),
            decoration: BoxDecoration(color: const Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String imagePath;

  const ImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bliss :)',
          style: TextStyle(color: Colors.black), // Set text color to black
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(imagePath), // Display image
      ),
    );
  }
}
