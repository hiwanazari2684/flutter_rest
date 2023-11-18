import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/user.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<User> users = [];
  Future get_users() async {
    final response =
        await http.get(Uri.parse('http://localhost/resttuto/users/read.php'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      setState(() {
        users = data.map<User>((item) => User.fromjson((item))).toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_users();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.all(8),
            padding:const EdgeInsets.all(8),
            color: const Color.fromARGB(77, 161, 158, 158),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CircleAvatar(
                child: Text(users[index].Id.toString()),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('${users[index].firstName}  ${users[index].lastName}'),
                  Text(users[index].email.toString())
                ],
              ),
              Image.network(users[index].image.toString(),width: 120,height: 120,)

            ]),
          );
        },
      ),
    );
  }
}
