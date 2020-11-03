import 'dart:async';
import 'dart:convert';
import 'package:practicoparcial2/Api_Services.dart';
import 'package:practicoparcial2/student.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:practicoparcial2/details.dart';
import 'package:http/http.dart' as http;

class StudentsListView extends StatelessWidget {
  final Api_Services api_services = Api_Services();
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    ListTile _tile(
        int id, String lastName, String firstName, DateTime enrollmentDate) {
      Student student =
          Student.newStudent(id, lastName, firstName, enrollmentDate);
      return ListTile(
        title: Text(
          firstName + ' ' + lastName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'ID: ' + id.toString(),
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        leading: Icon(
          Icons.account_box_outlined,
          color: Color(0xffffffff),
          size: 45.0,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Color(0xffffffff),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailStudent(student)),
          );
        },
      );
    }

    ListView _studentsListView(data) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(
            data[index].studentID,
            data[index].lastName,
            data[index].firstName,
            data[index].enrollmentDate,
          );
        },
      );
    }

    return FutureBuilder<List<Student>>(
      future: api_services.getStudents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Student> data = snapshot.data;
          return _studentsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
