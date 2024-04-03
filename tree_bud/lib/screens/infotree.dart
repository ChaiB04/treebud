import "package:flutter/material.dart";

class InfoTree extends StatelessWidget {
  const InfoTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Petunia"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) =>const ARfunction()),
              );
            }, 
            child: const Text("View tree")),
          ],
        ),
        ),
      );
}
}