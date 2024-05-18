import 'package:airease/models/user_model.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: Color.fromARGB(33, 134, 140, 1),
      appBar: AppBar(
       // backgroundColor: const Color(0xFF1D1D1F),
        title: Text('Profile',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(color: const Color(0xFF8C8A93), width: 2),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   margin: EdgeInsets.all(7.0),
        //   padding: EdgeInsets.only(right: 12, bottom: 5),
        //   // child: IconButton(
        //   //   icon: Icon(Icons.arrow_back, color: const Color(0xfffefefe)),
        //   // //  onPressed: () => Navigator.of(context).pop(),
        //   // ),
        // ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 30.0, 59.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    UserModel.firstName + " "+ UserModel.lastName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 37),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Account',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            _ChangeinAccount(
                context, 'Change account name', Icons.person_outlined, () {
              // Add your onPressed logic here
            }),
            _ChangeinAccount(
                context, 'Change account password', Icons.key_outlined, () {
              // Add your onPressed logic here
            }),
            _logout('Log out', Icons.logout),
            Spacer(),
          ],
        ),
      ),
     );
  }

  Widget _ChangeinAccount(BuildContext context, String text, IconData icon,
      VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
          bottom: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
          right: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
          left: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          leading: Icon(icon, color: Color.fromARGB(255, 255, 255, 255)),
          title: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
              ),
              Spacer(), // Add space to separate text and icon
              Icon(Icons.keyboard_arrow_right, color: Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          onTap: () {
            // Show AlertDialog when the option is pressed
            _showAlertDialog(context, text);
          },
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String option) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text('Are you sure to $option.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget _logout(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 120),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          leading: Icon(icon, color: const Color(0xffFF6363)),
          title: Text(
            text,
            style: TextStyle(color: const Color(0xffFF6363)),
          ),
          onTap: () {
            // Add your log out logic here
            // For example, you can navigate to a login screen
            //  Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
    );
  }
}
