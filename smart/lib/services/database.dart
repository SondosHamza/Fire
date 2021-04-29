import 'package:flutter/material.dart';
import 'package:smart/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});


 

  final CollectionReference smartCollection = FirebaseFirestore.instance.collection('patients');
  Future updateUserData(String username, String age, String gender, String partner) async{ 
    return await smartCollection.doc(uid).set({
      'username':username,
      'age':age, 
      'gender':gender, 
      'partner':partner
      });
    
  }
  //to convert the Snapshot into a List 
  List<Patient> _patientListFromSnapshot(QuerySnapshot snapshot){
    return Snapshot.docs.map((doc){
      return Patient(
        username: doc.data['username']?? '',
        age: doc.data['age'] ?? '0',
        gender: doc.data['gender'] ?? '',
        partner: doc.data['partner'] ?? '',
      );
    }).toList();   //convert into a list

  }

  //get smart stream
  Stream<List<Patient>> get patients{
    return smartCollection.snapshots().map(_patientListFromSnapshot);
  }
  // after the appBar
  body : PatientList(),

}