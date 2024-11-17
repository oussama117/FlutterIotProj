import 'package:flutter/material.dart';
import 'components/list_items.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String name = "Mohamed";
  String lastName = "louati";
  String email = "Mohamed@gmail.com";
  List<Users> users = [
    Users(1, true, "Mohamed", "louati", "Mohamed@gmail.com", "123"),
    Users(2, false, "Ranim", "Ranim", "Ranim@gmail.com", "123"),
    Users(3, true, "Melek", "Melek", "Melek@gmail.com", "123")
  ];

  void _addUser(int idUser, bool privilage, String name, String lastName,
      String email, String password) {
    setState(() {
      users.add(Users(idUser, privilage, name, lastName, email, password));
    });
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _updateUser(int index, int idUser, bool privilage, String name,
      String lastName, String email, String password) {
    setState(() {
      users[index] = Users(idUser, privilage, name, lastName, email, password);
    });
  }

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
              'Cheep Helper',
              style: TextStyle(
                  color: Color.fromARGB(255, 244, 111, 20),
                  fontFamily: "Source sans pro"),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User List",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text("Click or hold on list items"),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListItems(
                        users[index].idUser,
                        users[index].privilage,
                        users[index].name,
                        users[index].lastName,
                        users[index].email,
                        users[index].password,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  int newUserId = users.length + 1;
                  bool newPrivilage = false;
                  String newName = "";
                  String newLastName = "";
                  String newEmail = "";
                  String newPassword = "";

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Add New User'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration:
                                    const InputDecoration(labelText: 'Name'),
                                onChanged: (value) {
                                  newName = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Last Name'),
                                onChanged: (value) {
                                  newLastName = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  newEmail = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Password'),
                                obscureText: true,
                                onChanged: (value) {
                                  newPassword = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Checkbox(
                                    value: newPrivilage,
                                    onChanged: (value) {
                                      setState(() {
                                        newPrivilage = value ?? false;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "Admin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 30),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color.fromARGB(255, 244, 111, 20),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 111, 20),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                            ),
                            onPressed: () {
                              if (newName.isNotEmpty &&
                                  newLastName.isNotEmpty &&
                                  newEmail.isNotEmpty &&
                                  newPassword.isNotEmpty) {
                                _addUser(newUserId, newPrivilage, newName,
                                    newLastName, newEmail, newPassword);
                                Navigator.of(context).pop(); // Close the dialog
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            backgroundColor: const Color.fromARGB(255, 244, 111, 20),
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

class Users {
  final int idUser;
  final bool privilage;
  final String name;
  final String lastName;
  final String email;
  final String password;

  Users(this.idUser, this.privilage, this.name, this.lastName, this.email,
      this.password);
}
