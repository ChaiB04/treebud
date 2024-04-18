import 'package:mongo_dart/mongo_dart.dart';
import 'package:tree_bud/models/tree.dart';

Future<Db> startupDatabase() async {
  const String uri =
      'mongodb+srv://Chaimai:0IP806H2UQXZ5bAh@remake.vfb5bg5.mongodb.net/';

  final db = await Db.create(uri);

  await db.open();

  db.databaseName = "TreeBud";
  return db;
}

Future<Tree?> createTree(Tree newTree) async {

  try {
    Db db = await startupDatabase();

    final collection = db.collection('tree');

    await collection.insert({
      'id': newTree.id,
      'name': newTree.name,
      'password': newTree.location,
      'owner': newTree.owner,
      'taskHistory': newTree.taskHistory,
    });

    await db.close();

    return newTree;
  } catch (e) {
    print('Error connecting to MongoDB: $e');
  }

  return null;
}

Future<List<Tree>> getTrees() async {
  try {
    Db db = await startupDatabase();

    final collection = db.collection('tree');

    final trees = await collection.find().toList();

    List<Tree> treeList = [];
    for (var treeData in trees) {
      treeList.add(Tree.fromMap(treeData));
    }

    return treeList;
  } catch (e) {
    print('Error connecting to MongoDB: $e');
    return [];
  }
}