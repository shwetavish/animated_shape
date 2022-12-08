import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../widget/animated_shape.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  BehaviorSubject<bool> showShapeStream = BehaviorSubject();
  bool showShape = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 350, 16, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 11),
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 11),
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    showShapeStream.add(!showShape);
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<bool>(
              stream: showShapeStream,
              builder: (context, snapshot) {
                showShape = snapshot.data ?? showShape;
                return AnimatedShape(
                  color: Colors.blue,
                  show: showShape,
                  title: widget.title,
                );
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    showShapeStream.close();
    super.dispose();
  }
}
