

class UserWordBucket {

  final String uid;
  final String email;
  final String password;
  final String displayName;

  UserWordBucket({this.uid, this.email, this.password,this.displayName});

  @override
  String toString() {
    return 'UserWordBucket{uid: $uid}';
  }
}