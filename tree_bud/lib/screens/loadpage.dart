import "package:tree_bud/screens/arfunction.dart";
import "package:flutter/material.dart";

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
          ],
        ),
        ),
      );
}
}