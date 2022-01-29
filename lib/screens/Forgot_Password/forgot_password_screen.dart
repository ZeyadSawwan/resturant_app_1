import 'package:flutter/material.dart';
import 'package:resturant_app/Utils/custom_button.dart';
import 'package:resturant_app/screens/Forgot_Password/Forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotPasswordController = TextEditingController();
    var bloc = ForgotPasswordBloc();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80, bottom: 8),
              width: double.infinity,
              child: Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF747474)),
              ),
            ),
            Image.asset(
              "Assets/images/icon_for_app.png",
              scale: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
              child: TextField(
                controller: forgotPasswordController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Colors.green,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email ID / Phone Number",
                  hintStyle: TextStyle(color: Color(0xFF939393)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 131, 22, 22),
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 163, 154, 154),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: MyElevatedButton(
                height: 40,
                gradient: LinearGradient(
                    colors: [Color(0xFFCFA239), Color(0xFFE0AA3E)]),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onClick: () {},
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login Screen"),
            )
          ],
        ),
      ),
    );
  }
}
