import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(98, 98, 98, 1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
          ),
          width: 100,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: 60,
                //padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  height: 40,
                  width: 300,
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
