
import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:tree_bud/models/user.dart';

class Tree{
  String id;
  LatLng location;
  String name;
  User owner;
  Map<User, String> taskHistory;


  Tree(this.id, this.name, this.location, this.owner, this.taskHistory) ;

  factory Tree.fromMap(Map<String, dynamic> map) {

    final ownerMap = map['owner'] as Map<String, dynamic>;
    final owner = User.refactor(ownerMap);

    final taskHistoryMap = map['taskHistory'] as Map<String, dynamic>;
    final taskHistory = taskHistoryMap.map((key, value) {
      final user = User.refactor(jsonDecode(key));
      return MapEntry(user, value as String);
    });

    return Tree(
      map['id'] as String,
      map['name'] as String,
      map['location'] as LatLng,
      owner,
      taskHistory,
    );
  }
}