import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {

  final _firebaseAuth = FirebaseAuth.instance;

  Future? loginWithEmail({required String email, required String password}) async {
    try{

      var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      // return user;
      return user  != null;

    }catch(e){
      return e;
    }
  }

  Future? signUpWithEmail({required String email, required String password}) async {
    try{

      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      // return authResult.user;
      return authResult.user !=null;
    }catch(e){
      return e;
    }
  }
}