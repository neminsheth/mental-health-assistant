import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipd/colors.dart';
import 'package:ipd/feed/todo_widget.dart';


class ToDoListPage extends StatefulWidget {
  ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  // For demonstration purposes, replace this list with your actual ToDo data
  final List<Map<String, dynamic>> todosList = [
    {'id': '1', 'todoText': 'Task 1', 'isDone': false},
    {'id': '2', 'todoText': 'Task 2', 'isDone': true},
    // Add more ToDo items as needed
  ];

  List<Map<String, dynamic>> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = List.from(todosList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBox(),
            SizedBox(height: 20),
            Text(
              'All ToDos',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _foundToDo.length,
                itemBuilder: (context, index) {
                  return ToDoItem(
                    todo: _foundToDo[index],
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _handleToDoChange(Map<String, dynamic> todo) {
    setState(() {
      todo['isDone'] = !todo['isDone'];
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item['id'] == id);
      _runFilter(_todoController.text); // Update filtered list after deletion
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'todoText': toDo,
        'isDone': false,
      });
    });
    _todoController.clear();
    _runFilter(''); // Update filtered list after addition
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(todosList);
    } else {
      results = todosList
          .where((item) => item['todoText']
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        controller: _todoController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return FloatingActionButton(
      onPressed: () {
        _addToDoItem(_todoController.text);
      },
      child: Icon(
        Icons.add,
        size: 30,
      ),
      backgroundColor: AppColors.secondaryblue,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'To-do List',
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
