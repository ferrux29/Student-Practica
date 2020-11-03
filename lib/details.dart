import 'package:flutter/material.dart';
import 'package:practicoparcial2/Api_Services.dart';
import 'package:practicoparcial2/EditStudent.dart';
import 'package:practicoparcial2/student.dart';
import 'package:practicoparcial2/studentlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailStudent extends StatelessWidget {
  Student student;
  DetailStudent(this.student);
  final Api_Services api_services = Api_Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff062a46),
        title: Text("Details"),
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/good_night_img.png"),
                    fit: BoxFit.cover)),
          ),
          new Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.badge,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        title: Text(
                          'ID.-',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          student.studentID.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        title: Text(
                          'Full Name.-',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          student.firstName + ' ' + student.lastName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        title: Text(
                          'Enrollmant Date.-',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          student.enrollmentDate.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditStudent(student)),
                          );
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
                      RaisedButton(
                        onPressed: () {
                          api_services.deleteStudent(student.studentID);
                          Navigator.pop(context);
                        },
                        elevation: 0.0,
                        color: Colors.black26,
                        child: Text(
                          "Delete",
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
    );
  }
}
