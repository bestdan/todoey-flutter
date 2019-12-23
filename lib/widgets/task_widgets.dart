import 'package:flutter/material.dart';

List<Task> taskList = [
  Task(taskID: 1, taskName: "Get cheese", isCompleted: false),
  Task(taskID: 2, taskName: 'Get wine', isCompleted: false),
  Task(taskID: 3, taskName: 'Get wife', isCompleted: true),
];

class Task {
  int taskID;
  String taskName;
  bool isCompleted;
  Task({this.taskID, this.taskName, this.isCompleted});
}

class TaskTile extends StatefulWidget {
  int taskID;
  String taskName;
  bool isCompleted = false;
  TaskTile({this.taskID, this.taskName, this.isCompleted});

  @override
  _TaskTileState createState() => _TaskTileState(
        taskID: taskID,
        taskName: taskName,
        isCompleted: isCompleted,
      );
}

class _TaskTileState extends State<TaskTile> {
  int taskID;
  String taskName;
  bool isCompleted = false;
  _TaskTileState({this.taskID, this.taskName, this.isCompleted});

  void checkBoxCallback(bool value) {
    setState(() {
      print(taskID);
      taskList[taskID - 1].isCompleted = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TaskText(
        taskName: taskName,
        isCompleted: isCompleted,
      ),
      leading: TaskCheckBox(
        isCompleted: isCompleted,
        toggleCheckbox: checkBoxCallback,
      ),
    );
  }
}

class TaskText extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  TaskText({this.taskName, this.isCompleted});
  @override
  Widget build(BuildContext context) {
    return Text(
      taskName,
      style: TextStyle(
          decoration:
              isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool isCompleted;
  final Function toggleCheckbox;
  TaskCheckBox({this.isCompleted, this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isCompleted,
      onChanged: toggleCheckbox,
    );
  }
}

class TaskListView extends StatelessWidget {
  final List<Task> taskList;
  TaskListView(this.taskList);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      itemCount: taskList.length,
      itemBuilder: (context, int) {
        return TaskTile(
            taskID: taskList[int].taskID,
            taskName: taskList[int].taskName,
            isCompleted: taskList[int].isCompleted);
      },
    );
  }
}
