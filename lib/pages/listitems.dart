import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(100, 0, 0, 0),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0),
              ],
              borderRadius: BorderRadius.all(Radius.circular(15)),
              // color: Color.fromARGB(255, 255, 108, 4),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 244, 111, 20),
                  Color.fromARGB(255, 249, 138, 51),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                alignment: Alignment(2, 0),
                image: AssetImage(
                  "assets/listBack.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User: Mohamed@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 241, 241),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Mohamed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Last name",
                          style: TextStyle(
                            color: Color.fromARGB(255, 230, 230, 230),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Louati",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ))
              ],
            )),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
