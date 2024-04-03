import 'package:ar_function/screens/infotree.dart';
import 'package:flutter/material.dart';
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

  void displayPinpointMarker(ArCoreController controller) {
    final materials = ArCoreMaterial(color: Colors.green);
    final sphere = ArCoreSphere(radius: 0.05, materials: [materials]);
    final node = ArCoreNode(
      shape: sphere,
      position: vector64.Vector3(0.0, 0.0, -1.0),
    );

    controller.addArCoreNode(node);
  }

  void navigateToNewPage(BuildContext context) {
    coreController?.dispose();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InfoTree()),
    );
  }

  void navigateToMainPage(BuildContext context) {
    // Dispose of ArCoreController before navigating to the main page
    coreController?.dispose();

    Navigator.pop(context); // Navigate back to the main page
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
            onPressed: () =>
                navigateToMainPage(context), // Pass a function reference
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
