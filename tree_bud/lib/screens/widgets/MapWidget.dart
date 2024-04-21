import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:latlong2/latlong.dart';
import 'package:tree_bud/screens/widgets/PersonMarker.dart';
import 'package:tree_bud/screens/widgets/TreeMarker.dart';

import '../../models/tree.dart';
import '../../models/user.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  bool collapsedButtons = true;

  // Dummy trees
  List<Tree> trees = [];

  void addToTreeList() {
    // Creating new user and task history for the new tree
    User user3 = User('user3', 'Alice Johnson', 'pass');
    User user4 = User('user4', 'Bob Brown', 'pass');

    List<User> caretakers = [user4, user3];

    Map<User, String> newTaskHistory = {
      user3: 'Task started',
      user4: 'Task in progress',
    };

    // Creating a new tree and adding it to the list
    trees.add(Tree('1', 'Maple Tree', const LatLng(52.5200, 13.4050), user3,
        newTaskHistory, caretakers));
    trees.add(Tree('2', 'Apple Tree', const LatLng(52.2341, 13.2454), user4,
        newTaskHistory, caretakers));
    LatLng tree3LatLng = const LatLng(51.3775, 6.1725);
    LatLng tree4LatLng = const LatLng(51.3690, 6.1678);
    LatLng tree5LatLng = const LatLng(51.3682, 6.1761);
    LatLng tree6LatLng = const LatLng(51.3717, 6.1700);
    LatLng tree7LatLng = const LatLng(51.3752, 6.1740);
    LatLng tree8LatLng = const LatLng(51.3668, 6.1675);
    LatLng tree9LatLng = const LatLng(51.3676, 6.1769);
    LatLng tree10LatLng = const LatLng(51.3729, 6.1893);

    trees.add(Tree('3', 'Maple Tree', tree3LatLng, user3, newTaskHistory, caretakers));
    trees.add(Tree('4', 'Apple Tree', tree4LatLng, user4, newTaskHistory, caretakers));
    trees.add(Tree('5', 'Oak Tree', tree5LatLng, user3, newTaskHistory, caretakers));
    trees.add(Tree('6', 'Pine Tree', tree6LatLng, user4, newTaskHistory, caretakers));
    trees.add(Tree('7', 'Cherry Tree', tree7LatLng, user3, newTaskHistory, caretakers));
    trees.add(Tree('8', 'Birch Tree', tree8LatLng, user4, newTaskHistory, caretakers));
    trees.add(Tree('9', 'Willow Tree', tree9LatLng, user3, newTaskHistory, caretakers));
    trees.add(Tree('10', 'Fir Tree', tree10LatLng, user4, newTaskHistory, caretakers));
  }


  void _addMarkersForTrees() {
    for (var tree in trees) {
      addTreeMarker(tree.location);
    }
  }

  static const _useTransformerId = 'useTransformerId';

  final markers = ValueNotifier<List<AnimatedMarker>>([]);
  latlong.LatLng? center;

  @override
  void initState() {
    super.initState();
    markCenter();
    addToTreeList();
    _addMarkersForTrees();
  }

  Future<void> markCenter() async {
    center = await _determinePosition();
    addPersonMarker(center!);
  }

  void addPersonMarker(LatLng point) {
    markers.value = List.from(markers.value)
      ..add(
        PersonMarker(
          point: point,
          onTap: () => _animatedMapController.animateTo(
            dest: point,
            customId: _useTransformer ? _useTransformerId : null,
          ),
        ),
      );
  }

  final bool _useTransformer = true;

  late final _animatedMapController = AnimatedMapController(vsync: this);

  @override
  void dispose() {
    markers.dispose();
    _animatedMapController.dispose();
    super.dispose();
  }

  void addTreeMarker(LatLng point) {
    markers.value = List.from(markers.value)
      ..add(
        TreeMarker(
          point: point,
          onTap: () => _animatedMapController.animateTo(
            dest: point,
            customId: _useTransformer ? _useTransformerId : null,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<AnimatedMarker>>(
        valueListenable: markers,
        builder: (context, markers, _) {
          //Checks if it can find user location
          if (center == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Getting your location...'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(245, 247, 248, 1.0),
                  ),
                ],
              ),
            );
          }

          return FlutterMap(
              mapController: _animatedMapController.mapController,
              options: MapOptions(
                initialCenter: center!,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                  tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
                  tileProvider: CancellableNetworkTileProvider(),
                ),
                AnimatedMarkerLayer(markers: markers),
              ],
            );

        },
      ),
    );
  }
}

/// Inspired by the contribution of [rorystephenson](https://github.com/fleaflet/flutter_map/pull/1475/files#diff-b663bf9f32e20dbe004bd1b58a53408aa4d0c28bcc29940156beb3f34e364556)
final _animatedMoveTileUpdateTransformer = TileUpdateTransformer.fromHandlers(
  handleData: (updateEvent, sink) {
    final id = AnimationId.fromMapEvent(updateEvent.mapEvent);

    if (id == null) return sink.add(updateEvent);
    if (id.customId != _MapWidgetState._useTransformerId) {
      if (id.moveId == AnimatedMoveId.started) {
        debugPrint('TileUpdateTransformer disabled, using default behaviour.');
      }
      return sink.add(updateEvent);
    }

    switch (id.moveId) {
      case AnimatedMoveId.started:
        debugPrint('Loading tiles at animation destination.');
        sink.add(
          updateEvent.loadOnly(
            loadCenterOverride: id.destLocation,
            loadZoomOverride: id.destZoom,
          ),
        );
        break;
      case AnimatedMoveId.inProgress:
        // Do not prune or load during movement.
        break;
      case AnimatedMoveId.finished:
        debugPrint('Pruning tiles after animated movement.');
        sink.add(updateEvent.pruneOnly());
        break;
    }
  },
);

Future<latlong.LatLng> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    print("DENIED");
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  final position = await Geolocator.getCurrentPosition();

  return latlong.LatLng(position.latitude, position.longitude);
}
