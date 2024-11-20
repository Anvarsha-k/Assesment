import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0,top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let's Sign You in.",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 25),
              Text("Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Colors.grey
              ),),
              SizedBox(height: 15),
              Text("You've been missed!",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.grey
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
