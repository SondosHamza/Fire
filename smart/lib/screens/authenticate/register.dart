import 'package:flutter/material.dart';
import 'package:smart/screens/authenticate/sign_in.dart';
import 'package:smart/services/auth.dart';
import 'package:flutter/src/widgets/basic.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register ({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showSignIn = true;
  String email='';
  String password='';
  String age='';
  String gender='';
  String username='';
  String partner='';
  
  String error ='';
  @override
  Widget build(BuildContext context) {
    
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
            key: _formKey,
             child: Column(
              children: <Widget> [
                SizedBox( height: 20.0),
                TextFormField(
                   validator : (val)=> val.isEmpty ? 'Enter an Email': null,
                   onChanged(val){
                     setState(()=>email = val);
                  
                   }
    
              )
                SizedBox ( height:20.0),
                TextFormField(
                   validator : (val)=> val.length <6 ? 'Enter 6+ long password': null,
                   obSecureText: true
                   onChanged(val){
                     setState(()=> password = val);
                  
                    }
                  ),
              //      SizedBox ( height:20.0),
              //   TextFormField(
              //      validator : (val)=> val.isEmpty ? 'Enter a Username': null,
                  
              //      onChanged(val){
              //        setState(()=> username = val);
                  
              //       }
              //     ),
              //        SizedBox( height: 20.0),
              //   TextFormField(
              //      validator : (val)=> val.isEmpty ? 'Enter your Age': null,
              //      onChanged(val){
              //        setState(()=> age = val);
                  
              //      }
    
              // ),
              //    SizedBox( height: 20.0),
              //   TextFormField(
              //      validator : (val)=> val.isEmpty ? 'Enter your Gender': null,
              //      onChanged(val){
              //        setState(()=>gender = val);
                  
              //      }
    
              // ),
              //    SizedBox( height: 20.0),
              //   TextFormField(
              //      validator : (val)=> val.isEmpty ? 'Enter a Partner': null,
              //      onChanged(val){
              //        setState(()=> partner = val);
                  
              //      }
    
              // ),
                  // after the onPressed: () async{}
                  
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password),
                    if (result == null){
                    setState(()=> error = 'Please Enter a Valid Email and Password'),
                    }else{
                     
                    //print (email),
                    //print (password),

                  }
                  SizedBox(height:12.0),
                      Text(error,
                      style: TextStyle (color: Colors.red, fontSize: 14.0)
                      ),
                      
                    }
                
     
            
        ],
     
      ),
      );
    if (showSignIn){
      return SignIn();
    }
    else {return Register();}

  }
}