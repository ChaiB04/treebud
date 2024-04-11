import "package:tree_bud/screens/arfunction.dart";
import "package:flutter/material.dart";
import "package:tree_bud/screens/homepage.dart";
import "package:tree_bud/screens/new_tree_screens/newTree_step1.dart";

import "maps.dart";

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  void initState() {
    initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const ARfunction()),
              );
            }, 
            child: const Text("View tree")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapFunction()),
                  );
                },
                child: const Text("View Map")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text("Homepage")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewTreeStep1()),
                  );
                },
                child: const Text("Add tree")),
          ],
        ),
        ),
      );
}
}