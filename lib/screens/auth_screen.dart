import 'package:flutter/material.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/router/router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.themeColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: Text(
            'Авторизация',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 16, top: 10, left: 12, right: 12),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            initialValue: 'admin123',
            decoration: InputDecoration(
              hintText: 'Логин',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.grey[600], fontFamily: 'Gilroy'),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 16, top: 10, left: 12, right: 12),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            initialValue: 'password',
            decoration: InputDecoration(
              hintText: 'Пароль',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.grey[600], fontFamily: 'Gilroy'),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: SizedBox(
            width: 170,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.HOME);
              },
              child: const Center(
                child: Text(
                  'ВОЙТИ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
