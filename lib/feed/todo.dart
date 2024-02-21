import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipd/colors.dart';

import '../home.dart';

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<Map<String, dynamic>> todosList = [];

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
      appBar: appBar(),
      body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBox(),
              SizedBox(height: 20),
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
              SizedBox(height: 10),
              _buildAddTaskInput(),
          ],
        ),
        ),
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) => _runFilter(value),
              controller: _todoController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
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
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
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

  Widget _buildAddTaskInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _todoController,
            cursorColor: AppColors.secondaryblue, // Set cursor color
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: 'Add a new task',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.secondaryblue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.secondaryblue),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _addToDoItem(_todoController.text);
          },
          icon: Icon(Icons.add, size: 30),
          color: AppColors.secondaryblue,
        ),
      ],
    );
  }
}

class ToDoItem extends StatelessWidget {
  final Map<String, dynamic> todo;
  final Function(Map<String, dynamic>) onToDoChanged;
  final Function(String) onDeleteItem;

  ToDoItem({
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryblue, // Choose your border color
          width: 1.0, // Choose your border width
        ),
        borderRadius: BorderRadius.circular(25.0), // Choose your border radius
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          todo['todoText'],
          style: TextStyle(
            decoration: todo['isDone'] ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            checkColor: Colors.white,
            shape: CircleBorder(),
            activeColor: AppColors.secondaryblue,
            value: todo['isDone'],
            onChanged: (value) {
              onToDoChanged(todo);
            },
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            onDeleteItem(todo['id']);
          },
        ),
      ),
    );
  }
}
