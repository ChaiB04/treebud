import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:latlong2/latlong.dart';
import 'package:tree_bud/screens/widgets/SeparatedColumn.dart';
import 'package:tree_bud/screens/widgets/TreeMarker.dart';

import '../models/tree.dart';
import '../models/user.dart';

class MapFunction extends StatefulWidget {
  const MapFunction({super.key});

  @override
  State<MapFunction> createState() => _MapFunctionState();
}

class _MapFunctionState extends State<MapFunction> with TickerProviderStateMixin {



  // Dummy trees
  List<Tree> trees = [];

  void addToTreeList() {
    // Creating new user and task history for the new tree
    User user3 = User('user3', 'Alice Johnson', 'pass');
    User user4 = User('user4', 'Bob Brown', 'pass');

    Map<User, String> newTaskHistory = {
      user3: 'Task started',
      user4: 'Task in progress',
    };

    // Creating a new tree and adding it to the list
    trees.add(Tree('3', 'Maple Tree', LatLng(52.5200, 13.4050), user3, newTaskHistory));
    trees.add(Tree('4', 'Apple Tree', LatLng(52.2341, 13.2454), user4, newTaskHistory));
  }


  void _addMarkersForTrees() {
    for (var tree in trees) {
      _addMarker(tree.location);
    }
  }

  @override
  void initState(){
    addToTreeList();
    _addMarkersForTrees();
    super.initState();
  }
  static const _useTransformerId = 'useTransformerId';

  final markers = ValueNotifier<List<AnimatedMarker>>([]);
  final center = const latlong.LatLng(51.509364, -0.128928);

  bool _useTransformer = true;
  int _lastMovedToMarkerIndex = -1;

  late final _animatedMapController = AnimatedMapController(vsync: this);

  @override
  void dispose() {
    markers.dispose();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<AnimatedMarker>>(
        valueListenable: markers,
        builder: (context, markers, _) {
          return FlutterMap(
            mapController: _animatedMapController.mapController,
            options: MapOptions(
              initialCenter: center,
              // onPositionChanged: (_, point) => _updateMarker(),
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
          FloatingActionButton(
            onPressed: () => _animatedMapController.animatedRotateFrom(
              90,
              customId: _useTransformer ? _useTransformerId : null,
            ),
            tooltip: 'Rotate 90°',
            child: const Icon(Icons.rotate_right),
          ),
          FloatingActionButton(
            onPressed: () => _animatedMapController.animatedRotateFrom(
              -90,
              customId: _useTransformer ? _useTransformerId : null,
            ),
            tooltip: 'Rotate -90°',
            child: const Icon(Icons.rotate_left),
          ),
          FloatingActionButton(
            onPressed: () {
              markers.value = [];
              _animatedMapController.animateTo(
                dest: center,
                rotation: 0,
                customId: _useTransformer ? _useTransformerId : null,
              );
            },
            tooltip: 'Clear modifications',
            child: const Icon(Icons.clear_all),
          ),
          FloatingActionButton(
            onPressed: () => _animatedMapController.animatedZoomIn(
              customId: _useTransformer ? _useTransformerId : null,
            ),
            tooltip: 'Zoom in',
            child: const Icon(Icons.zoom_in),
          ),
          FloatingActionButton(
            onPressed: () => _animatedMapController.animatedZoomOut(
              customId: _useTransformer ? _useTransformerId : null,
            ),
            tooltip: 'Zoom out',
            child: const Icon(Icons.zoom_out),
          ),
          FloatingActionButton(
            tooltip: 'Center on markers',
            onPressed: () {
              if (markers.value.length < 2) return;

              final points = markers.value.map((m) => m.point).toList();
              _animatedMapController.animatedFitCamera(
                cameraFit: CameraFit.coordinates(
                  coordinates: points,
                  padding: const EdgeInsets.all(12),
                ),
                rotation: 0,
                customId: _useTransformer ? _useTransformerId : null,
              );
            },
            child: const Icon(Icons.center_focus_strong),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                tooltip: 'Move to next marker with offset',
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
                    offset: const Offset(100, 100),
                  );
                },
                child: const Icon(Icons.multiple_stop),
              ),
              const SizedBox.square(dimension: 8),
              FloatingActionButton(
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
                child: const Icon(Icons.polyline_rounded),
              ),
            ],
          ),
          FloatingActionButton.extended(
            label: Row(
              children: [
                const Text('Transformer'),
                Switch(
                  activeColor: Colors.blue.shade200,
                  activeTrackColor: Colors.black38,
                  value: _useTransformer,
                  onChanged: (newValue) {
                    setState(() => _useTransformer = newValue);
                  },
                ),
              ],
            ),
            onPressed: () {
              setState(() => _useTransformer = !_useTransformer);
            },
          ),
        ],
      ),
    );
  }

  void _addMarker(LatLng point) {
    markers.value = List.from(markers.value)
      ..add(
        TreeMarker(
          point: point as latlong.LatLng,
          onTap: () => _animatedMapController.animateTo(
            dest: point as latlong.LatLng,
            customId: _useTransformer ? _useTransformerId : null,
          ),
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
