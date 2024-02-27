import 'package:flutter/material.dart';

class UserData {
  final int id;
  final String name;
  final String phone;
  UserData(
    this.id,
    this.name,
    this.phone,
  );
}

class ChatScreen extends StatelessWidget {
  List<UserData> user = [
    UserData(1, 'Ali lotfy', '01554534204'),
    UserData(2, 'mohame lotfy', '01552254204'),
    UserData(3, 'ahmed lotfy', '018523222204'),
    UserData(4, 'waal lotfy', '0122555522204'),
    UserData(5, 'moaz lotfy', '0102525525552'),
    UserData(1, 'Ali lotfy', '01554534204'),
    UserData(2, 'mohame lotfy', '01552254204'),
    UserData(3, 'ahmed lotfy', '018523222204'),
    UserData(4, 'waal lotfy', '0122555522204'),
    UserData(5, 'moaz lotfy', '0102525525552'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20.0,
            start: 50.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blueAccent,
                child: Text('${user[index].id}'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user[index].name),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(user[index].phone),
                ],
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20.0,
        ),
        itemCount: user.length,
      ),
    );
  }
}
