import 'package:mongo_dart/mongo_dart.dart';
import 'package:tree_bud/models/user.dart';

Future<Db> startupDatabase() async {
  const String uri =
      'mongodb+srv://Chaimai:0IP806H2UQXZ5bAh@remake.vfb5bg5.mongodb.net/';

  final db = await Db.create(uri);

  await db.open();

  db.databaseName = "TreeBud";
  return db;
}

Future<User?> createUser(User newuser) async {

  try {
    Db db = await startupDatabase();

    final collection = db.collection('user');

    await collection.insert({
      'id': newuser.id,
      'username': newuser.username,
      'password': newuser.password,
    });

    await db.close();

    return newuser;
  } catch (e) {
    print('Error connecting to MongoDB: $e');
  }

  return null;
}

Future<User?> login(String username, String password) async {
  try{
    Db db = await startupDatabase();

    final collection = db.collection('user');

    final user = await collection.findOne({
      'username': username,
      'password': password,
    });

    if (user != null) {
      return User.refactor(user);
    }
    else{
      print("cannot find user with those credentials");
    }
  }
  catch (e) {
    print('Error connecting to MongoDB: $e');
  }
}

