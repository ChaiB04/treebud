import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:latlong2/latlong.dart';
import 'package:tree_bud/screens/homepage.dart';
import 'package:tree_bud/screens/loadpage.dart';
import 'package:tree_bud/screens/new_tree_screens/newTree_step1.dart';
import 'package:tree_bud/screens/widgets/PersonMarker.dart';
import 'package:tree_bud/screens/widgets/SeparatedColumn.dart';
import 'package:tree_bud/screens/widgets/TreeMarker.dart';

import '../models/tree.dart';
import '../models/user.dart';
import 'arfunction.dart';

class MapFunction extends StatefulWidget {
  const MapFunction({super.key});

  @override
  State<MapFunction> createState() => _MapFunctionState();
}

class _MapFunctionState extends State<MapFunction>
    with TickerProviderStateMixin {
  bool collapsedButtons = true;

  // Dummy trees
  List<Tree> trees = [];

  void addToTreeList() {
    User user3 = User('user3', 'Alice Johnson', 'pass');
    User user4 = User('user4', 'Bob Brown', 'pass');

    List<User> caretakers = [user4, user3];

    Map<User, String> newTaskHistory = {
      user3: 'Task started',
      user4: 'Task in progress',
    };

    // Different LatLng for each tree
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

  final bool _useTransformer = true;
  int _lastMovedToMarkerIndex = -1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromRGBO(41, 57, 33, 1.0),
        iconTheme: const IconThemeData(color: Color.fromRGBO(245, 247, 248, 1.0)),
      ),
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
              keepAlive: true,
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
      floatingActionButton: SeparatedColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          separator: const SizedBox(height: 8),
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: collapsedButtons ? 0 : null,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                      heroTag: 'next_marker_button',
                      tooltip: 'Move to next marker',
                      onPressed: () {
                        if (markers.value.isEmpty) return;

                        final points = markers.value.map((m) => m.point);
                        setState(
                          () => _lastMovedToMarkerIndex =
                              (_lastMovedToMarkerIndex + 1) % points.length,
                        );

                        _animatedMapController.animateTo(
                          dest: points.elementAt(_lastMovedToMarkerIndex),
                          customId: _useTransformer ? _useTransformerId : null,
                        );
                      },
                      backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                      elevation: 0, // Set elevation to 0 to remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.not_listed_location,
                        color: Color.fromRGBO(245, 247, 248, 1.0),
                      ),
                    ),
                    const SizedBox.square(dimension: 8),
                    FloatingActionButton(
                      heroTag: 'your_location_button',
                      onPressed: () {
                        // markers.value = [];
                        markCenter();
                        _animatedMapController.animateTo(
                          dest: center,
                          rotation: 0,
                          customId: _useTransformer ? _useTransformerId : null,
                        );
                      },
                      backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                      elevation: 0, // Set elevation to 0 to remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tooltip: 'Go to your location',
                      child: const Icon(
                        Icons.person_search,
                        color: Color.fromRGBO(245, 247, 248, 1.0),
                      ),
                    ),
                    const SizedBox.square(dimension: 8),
                    FloatingActionButton(
                      heroTag: 'zoom_in_button',
                      onPressed: () => _animatedMapController.animatedZoomIn(
                        customId: _useTransformer ? _useTransformerId : null,
                      ),
                      backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                      elevation: 0, // Set elevation to 0 to remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tooltip: 'Zoom in',
                      child: const Icon(
                        Icons.zoom_in,
                        color: Color.fromRGBO(245, 247, 248, 1.0),
                      ),
                    ),
                    const SizedBox.square(dimension: 8),
                    FloatingActionButton(
                      heroTag: 'zoom_out_button',
                      onPressed: () => _animatedMapController.animatedZoomOut(
                        customId: _useTransformer ? _useTransformerId : null,
                      ),
                      backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                      elevation: 0, // Set elevation to 0 to remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tooltip: 'Zoom out',
                      child: const Icon(
                        Icons.zoom_out,
                        color: Color.fromRGBO(245, 247, 248, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ARfunction()),
                    );
                  },
                  backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color.fromRGBO(245, 247, 248, 1.0),
                  ),
                ),
                const SizedBox.square(dimension: 8),
                SizedBox(
                  width: 200,
                  height: 55,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewTreeStep1(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(73, 97, 36, 1.0),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text("Plant your tree!"),
                  ),
                ),
                const SizedBox.square(dimension: 8),
                FloatingActionButton(
                  heroTag: 'show_tools_button',
                  tooltip: 'Show tools',
                  onPressed: () {
                    setState(() {
                      collapsedButtons = !collapsedButtons;
                    });
                  },
                  backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
                  elevation: 0, // Set elevation to 0 to remove shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: collapsedButtons
                      ? const Icon(
                          Icons.arrow_drop_up,
                          size: 40,
                          color: Color.fromRGBO(245, 247, 248, 1.0),
                        )
                      : const Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                          color: Color.fromRGBO(245, 247, 248, 1.0),
                        ),
                ),
              ],
            ),
          ],
        ),

    );
  }
}

/// Inspired by the contribution of [rorystephenson](https://github.com/fleaflet/flutter_map/pull/1475/files#diff-b663bf9f32e20dbe004bd1b58a53408aa4d0c28bcc29940156beb3f34e364556)
final _animatedMoveTileUpdateTransformer = TileUpdateTransformer.fromHandlers(
  handleData: (updateEvent, sink) {
    final id = AnimationId.fromMapEvent(updateEvent.mapEvent);

    if (id == null) return sink.add(updateEvent);
    if (id.customId != _MapFunctionState._useTransformerId) {
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
