import 'package:flutter/material.dart';
import 'package:smart/services/auth.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/basic.dart';


class SignIn extends StatefulWidget {

   final Function toggleView;
  SignIn ({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth= AuthService();
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password= '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    Container(
          
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
                  // after the onPressed: () async{}
                  
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password),
                    if (result == null){
                    setState(()=> error = 'Invalid Email or Password'),
                    }
                    //print (email),
                    //print (password),

                  }
                  SizedBox(height:12.0),
                      Text(error,
                      style: TextStyle (color: Colors.red, fontSize: 14.0),
                      ),
                      
                
                ],
         
              ),
        
          ) 
          
        );
        return container;
  }
}