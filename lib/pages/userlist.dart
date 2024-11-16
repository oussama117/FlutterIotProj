import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'User List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 108, 4),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                  ),
                                ),
                                SizedBox(
                                  height: 32.0,
                                ),
                                Text(
                                  "User",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                              ],
                            ))
                      ],
                    )),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add New User'),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Last Name'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle adding new user logic
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color.fromARGB(255, 255, 108, 4),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
