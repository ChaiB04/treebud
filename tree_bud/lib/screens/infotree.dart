import 'package:ar_function/widgets/historyname.dart';
import 'package:flutter/material.dart';

class InfoTree extends StatelessWidget {
  const InfoTree({super.key});

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
            padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Row(
                  children: [
                    Text(
                      'Pamela ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.info, 
                      color: Colors.white, 
                      size: 20),
                    ]
                ),
              ),
              
              

          Container(
            color: const Color.fromARGB(255, 10, 48, 11),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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

                ProfileInfo(
                  imageUrl: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                  name: 'You',
                  task: 'Watered tree ',
                  time: '5 hours ago',
                ),
                InfoCard(task: 'Watered tree ', time: '5 hours ago',),
                
                ProfileInfo(
                  imageUrl: 'https://images.unsplash.com/photo-1558072844-b2e8b546d415?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                  name: 'Nicole Kerr', 
                  task: 'Cleaned tree ', 
                  time: '1 day ago'
                ),
                InfoCard(task: 'Cleaned tree', time: '1 day ago'),
                
                ProfileInfo(
                  imageUrl: 'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D',
                  name: 'Simon Craig', 
                  task: 'Fed tree ', 
                  time: '3 days ago'
                ),
                InfoCard(task: 'Fed tree', time: '3 days ago'),

              ],
            ),
          ),
              ],
            ),
          ),
        ],
      ),
      );
  }
}