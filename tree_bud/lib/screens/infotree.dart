import 'package:ar_function/widgets/historyname.dart';
import 'package:flutter/material.dart';

class InfoTree extends StatelessWidget {
  InfoTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 97, 36, 1.0),
        toolbarHeight: 40,
      ),
      backgroundColor: const Color.fromARGB(255, 118, 131, 109),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/boomstam.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 32.0),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Pamela',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text('* INFO TREE'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.info, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Clean it',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Feed it',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(73, 97, 36, 1.0),
                        ),
                      ),
                      child: const Text(
                        'Water it',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            color: const Color.fromARGB(255, 10, 48, 11),
            child: const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(255, 10, 48, 11),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInfo(
                      imageUrl: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                      name: 'Ian Wright',
                      task: 'Watered tree ',
                      time: '5 hours ago',
                    ),
                    InfoCard(task: 'Watered tree', time: '5 hours ago'),
                    ProfileInfo(
                      imageUrl: 'https://images.unsplash.com/photo-1558072844-b2e8b546d415?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                      name: 'You',
                      task: 'Cleaned tree ',
                      time: '1 day ago',
                    ),
                    InfoCard(task: 'Cleaned tree', time: '1 day ago'),
                    ProfileInfo(
                      imageUrl: 'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                      name: 'Simon Craig',
                      task: 'Fed tree ',
                      time: '3 days ago',
                    ),
                    InfoCard(task: 'Fed tree', time: '3 days ago'),
                    ProfileInfo(
                      imageUrl: 'https://images.unsplash.com/photo-1629096346363-b96e4d9634a1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FwbGluZ3xlbnwwfHwwfHx8Mg%3D%3D',
                      name: 'Tree: Pamela',
                      task: 'Tree planted ',
                      time: '4 days ago',
                    ),
                    InfoCard(task: 'Planted tree', time: '4 days ago'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}