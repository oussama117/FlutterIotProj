import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  final int idUser;
  final String name;

  final String lastName;

  final String email;
  final String password;
  final bool privilage;
  const ListItems(this.idUser, this.privilage, this.name, this.lastName,
      this.email, this.password,
      {super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  String userPrivilage() {
    if (widget.privilage) {
      return 'Admin';
    } else {
      return 'Client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(60, 0, 0, 0),
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
      ),
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            height: 340,
            bottom: -140,
            right: -50,
            child: Image.asset(
              "assets/listBack.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    color: Color.fromARGB(255, 241, 241, 241),
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                const Text(
                  "Last name",
                  style: TextStyle(
                    color: Color.fromARGB(255, 230, 230, 230),
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.lastName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                const Text(
                  "User Privilage",
                  style: TextStyle(
                    color: Color.fromARGB(255, 230, 230, 230),
                    fontSize: 12,
                  ),
                ),
                Text(
                  userPrivilage(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 15,
            right: 15,
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.create,
                    color: Color.fromARGB(255, 244, 111, 20),
                    size: 26,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 244, 111, 20),
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.list_rounded,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
