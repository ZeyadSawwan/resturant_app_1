import 'package:flutter/material.dart';
import 'package:resturant_app/screens/Forgot_Password/forgot_password_screen.dart';
import 'package:resturant_app/screens/Home/Home_screen.dart';
import 'package:resturant_app/Utils/custom_button.dart';
import 'package:resturant_app/screens/Login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var bloc = LoginScreenBloc();

  @override
  Widget build(BuildContext context) {
    passwordController.text = "123";
    userNameController.text = "zeyad";
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80, bottom: 8),
                width: double.infinity,
                child: Text(
                  "Login",
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
                  controller: userNameController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "User Name",
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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
                child: TextField(
                  obscureText: !bloc.isPasswordShown,
                  controller: passwordController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        bloc.isPasswordShown
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),

                      // child: Text(bloc.isPasswordShown ? "Hide" : "Show",
                      //  style: TextStyle(color: Colors.purple)),
                      onPressed: () {
                        bloc.isPasswordShown = !bloc.isPasswordShown;
                        // print("isPasswordShown");
                        // print(isPasswordShown);
                        setState(() {});
                      },
                    ),
                    hintText: "Password",
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
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  bloc.validateLoginFieldText(
                      userNameController.text, passwordController.text),
                  style: TextStyle(
                      color: bloc.validateLoginFieldColor(
                          bloc.validateLoginFieldText(userNameController.text,
                              passwordController.text))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: MyElevatedButton(
                  height: 40,
                  gradient: LinearGradient(
                      colors: bloc.validateLoginField(
                              userNameController.text, passwordController.text)
                          ? [Color(0xFFCFA239), Color(0xFFE0AA3E)]
                          : [
                              Color.fromARGB(255, 119, 118, 118),
                              Color.fromARGB(255, 202, 188, 199)
                            ]),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onClick: bloc.validateLoginField(
                          userNameController.text, passwordController.text)
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                      : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Facebook",
                        style: TextStyle(color: Color(0xFF4267B2)),
                      )),
                  Container(
                    color: Colors.grey,
                    width: 1,
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Google",
                        style: TextStyle(color: Color(0xFFDB4437)),
                      )),
                  Container(
                    color: Colors.grey,
                    width: 1,
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("iCloud",
                        style: TextStyle(color: Color(0xFF007aff))),
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    child: Text("Forgot Password"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                  )),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                      width: 145,
                      child: TextButton(
                          onPressed: () {}, child: Text("Create New Account"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
