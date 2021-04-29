import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:smart/models/patient.dart';
import 'package:smart/services/auth.dart';
import 'package:smart/services/database.dart';
import 'package:smart/screens/authenticate/home/patient_list.dart';
import 'package:smart/models/patient.dart';

class home extends StatelessWidget {
  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Patient>>.value(
      value: DatabaseService().patients,
          child: Container(
        
      ),
    );
  }
}
//instead of return scaffold --> wrap with new widget 
