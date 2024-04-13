import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/screens/Informasi_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 14, 187),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width * 0.2),
                Image.asset(
                  'assets/images/manusia.png', 
                  width: media.width * 0.6,
                ),
                SizedBox(height: media.width * 0.1),
                Text(
                  "Hey there,",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  "Welcome To Skincare",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: media.width * 0.1),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: media.width * 0.04),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // Toggle password visibility
                      },
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: media.width * 0.04),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "Informasi Screen"),
                      ),
                    );
                  },
                  child: Container(
                    width: media.width * 0.8,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                TextButton(
                  onPressed: () {
                    // Navigate to registration screen
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Don’t have an account yet? Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
