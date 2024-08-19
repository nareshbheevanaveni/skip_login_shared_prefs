import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skip_login_shared_pref/home_page.dart';
import 'package:skip_login_shared_pref/main.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),

      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Username'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
          ),
          SizedBox(height: 11,),
          TextField(
            decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),
          ),
          SizedBox(height: 11,),
          ElevatedButton(onPressed: ()async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(SplashScreenState.KEYLOGIN, true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }, child: Text('Login'))

        ],
      ),
    );
  }
}
