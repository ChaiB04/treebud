import 'package:ar_function/widgets/historyname.dart';
import 'package:flutter/material.dart';

class InfoTree extends StatelessWidget {
  const InfoTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pamela'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF15161E),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
              ],
    ),
    ),
    ],
    ),
    ),
    );
  }
}
