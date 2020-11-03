import 'package:flutter/material.dart';
import 'package:practicoparcial2/Api_Services.dart';
import 'package:practicoparcial2/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditStudent extends StatelessWidget {
  Student student;
  final Api_Services api_services = Api_Services();
  SharedPreferences sharedPreferences;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  EditStudent(this.student);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff062a46),
        title: Text("Edit Student"),
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage("assets/img/good_night_img.png"),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_box_outlined,
                        color: Colors.white,
                        size: 50.0,
                      ),
                      title: Text(
                        'FirstName.-',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: TextFormField(
                        controller: firstName,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter the new FirstName",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_box_outlined,
                        color: Colors.transparent,
                        size: 50.0,
                      ),
                      title: Text(
                        'LastName.-',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: TextFormField(
                        controller: lastName,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter the new LastName",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Student newStudent = Student.newStudent(
                                  1,
                                  lastName.text,
                                  firstName.text,
                                  DateTime.now());
                              api_services.putStudent(
                                  student.studentID, newStudent);
                              Navigator.pop(context);
                            },
                            elevation: 0.0,
                            color: Colors.black26,
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white70),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
