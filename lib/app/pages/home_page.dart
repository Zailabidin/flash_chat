import 'package:flash_chat/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, this.userModel});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade400,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
              radius: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  ' userModel!.name!,',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Online last seen,2:02 pm',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
      body: Material(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.greenAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'userModel!.email!',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Salam kandaysin?',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
