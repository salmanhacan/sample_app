import 'package:flutter/material.dart';
import 'package:sample_app/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  bool is_login = false;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate() == true) {
      setState(() {
        is_login = true;
      });
      await Future.delayed(
        Duration(seconds: 1),
      );
      Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        is_login = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(
              "assets/images/mobile_login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter Username",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == "") {
                        return "Please Enter Username.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty == true) {
                        return "Please Enter Password";
                      } else if (value.length < 6) {
                        return "Password should be atleast 6 character long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      height: 50,
                      width: is_login ? 50 : 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(is_login ? 50 : 5),
                      ),
                      duration: Duration(milliseconds: 700),
                      child: is_login
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
