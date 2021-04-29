import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:smart/models/patient.dart';
import 'package:smart/models/patient.dart';


 //access data from stream
class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
    // print(patients.docs);
    // //to see what is going in the data or to get the data and documents
    // for (var doc in patients.docs){
    //   print (doc.data());
    // }
    patients.forEach((Patient) {
      print(Patient.username);
      print(Patient.age);
      print(Patient.gender);
      print(Patient.partner);

    });
    return Container(
      
    );
  }
}