import 'package:tree_bud/screens/infotree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ARfunction extends StatefulWidget {
  const ARfunction({super.key});

  @override
  State<ARfunction> createState() => _ARfunctionState();
}

class _ARfunctionState extends State<ARfunction> {
  ArCoreController? coreController;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   try {
  //     coreController?.dispose();
  //   } catch (e) {
  //     print('Error disposing ArCoreController: $e');
  //   }
  //   super.dispose();
  // }

  void augmentedRealityViewCreated(ArCoreController controller) {
    coreController = controller;

    displayPinpointMarker(coreController!);
  }

// Source: https://github.com/giandifra/arcore_flutter_plugin/issues/66
  Future<void> displayPinpointMarker(ArCoreController controller) async {
    final bytes =
        (await rootBundle.load('assets/images/marker.png')).buffer.asUint8List();

    final earth = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 80, height: 100),
      position: vector64.Vector3(0.0, 0.0, -1.0),
    );

    controller.addArCoreNode(earth);
  }

  void navigateToNewPage(BuildContext context) {
    coreController?.dispose();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoTree()),
    );
  }

  void navigateToMainPage(BuildContext context) {
    // Dispose of ArCoreController before navigating to the main page
    coreController?.dispose();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: augmentedRealityViewCreated,
          ),
          GestureDetector(
            onTap: () => navigateToNewPage(context),
            behavior: HitTestBehavior.translucent,
          ),
          ElevatedButton(
            onPressed: () => navigateToMainPage(context),
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
