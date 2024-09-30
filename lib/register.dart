import 'package:flutter/material.dart';
import 'package:food_app/login_page.dart';

void main() {
  runApp(const LoginPage());
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = "";
  String password = "";
  String konfpass = "";
  bool isResgisterSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          _usernameField(),
          _passwordField(),
          _konfpassField(),
          _loginButton(),
        ],
      ),
    ));
  }

  Widget _usernameField() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.all(8.0),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 48, 153, 174))),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: (isResgisterSuccess)
                    ? const Color.fromARGB(255, 48, 153, 174)
                    : const Color.fromARGB(255, 229, 15, 0),
              ),
            ),
          ),
        ));
  }

  Widget _passwordField() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
            enabled: true,
            decoration: const InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 48, 153, 174))),
            )));
  }

  Widget _konfpassField() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
            enabled: true,
            decoration: const InputDecoration(
              hintText: 'Konfirmasi Password',
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 48, 153, 174))),
            )));
  }

  Widget _loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: (isResgisterSuccess)
                ? const Color.fromARGB(255, 48, 153, 174)
                : const Color.fromARGB(255, 229, 15, 0),
            foregroundColor: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const LoginPage();
          }));
          String text = "";
          if (username == "" && password == ""&& konfpass == "") {
            text = "Register Berhasil";
          } else {
            text = "Register Gagal";
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Register'),
      ),
    );
  }
}
