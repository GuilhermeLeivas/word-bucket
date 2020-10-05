class UserWordBucket {

  final String uid;
  final String email;
  final String password;

  UserWordBucket({this.uid, this.email, this.password});

  @override
  String toString() {
    return 'UserWordBucket{uid: $uid}';
  }
}