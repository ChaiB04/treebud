import "package:ar_function/screens/arfunction.dart";
import "package:flutter/material.dart";

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

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