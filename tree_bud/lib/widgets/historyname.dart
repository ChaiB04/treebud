import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Color backgroundColor;
  final Color textColor;
  final String task;
  final String time;

  const ProfileInfo({
    super.key,
    required this.imageUrl,
    required this.name,
    this.backgroundColor = const Color.fromARGB(255, 10, 48, 11),
    this.textColor = Colors.white, required this.task, required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  imageUrl,
                  width: 50, 
                  height: 50, 
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,   
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6, left: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: task,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: time,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String task;
  final String time;

  const InfoCard({
    super.key,
    required this.task,
    required this.time,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 48,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 10, 48, 11),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6, left: 20),
                child: RichText(
                  text:const  TextSpan(
                    children: [
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
