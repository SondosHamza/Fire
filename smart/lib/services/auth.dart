import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart/models/user.dart';
import 'package:smart/services/database.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser (FirebaseUser user){
    return user != null ? user(uid:user.uid):null;
  }
  
    
    // sign out
    Stream<User> get User{
      return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser(User));
    }
      // sign in 
    Future signInWithEmailAndPassword(String email, String password) async{
      try{
        Authresult result = await _auth.signInWithEmailAndPassword(email:email,password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);

      }catch(e){
        print(e.toString());
        return null;

      }
    }  

    // register with email and password

    Future registerWithEmailAndPassword(String email, String password) async{
      try{
        Authresult result = await _auth.createUserWithEmailAndPassword(email:email,password: password);
                FirebaseUser user = result.user;

                //create a new document for the user with thr uid
                await DatabaseService (uid:user.uid).updateUserData('patient', '0', 'female', 'hey');
                
                return _userFromFirebaseUser(user);
        
              }catch(e){
                print(e.toString());
                return null;
        
              }
            }
          }
        
   
}
  
  //mFirebaseAnalytics.setUserProperty("favorite_food", mFavoriteFood);
