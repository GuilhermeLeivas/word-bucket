import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_bucket/model/user_word_bucket.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth
      .instance; // Objeto que permite a comunicacao entre nossso app e o firebase auth

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User user = userCredential.user;
      UserWordBucket anonWordBucketUser = _userFromFirebaseUser(user);
      return anonWordBucketUser;
    } catch (e) {
      print(e);
    }
  }

//sign in with email & password
  Future<UserWordBucket> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

// register with email & password
  Future<UserWordBucket> registerWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Criamos um usuario customizado apartir do FirbaseUser
  UserWordBucket _userFromFirebaseUser(User user) {
    return user != null ? UserWordBucket(uid: user.uid, email: user.email) : null;
  }

  Stream<UserWordBucket> get user {
    // Este metodo nos retorna cada mudanca de estado de autenticacao na aplicacao, caso o usuaio logue, deslogue, etc. Este metodo e um fluxo, pois temos uma stream.

    return _firebaseAuth
        .authStateChanges()
        .map((user) => _userFromFirebaseUser(user));
    // Alem de pegarmos o estado, mudamos nossa stream de FirebaseUser para nosso User customizado.
  }
}
