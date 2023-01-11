import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/app_constant.dart';
import '../widget/my_animation.dart';

class WateryWavePage extends StatefulWidget {
  const WateryWavePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WateryWavePage> createState() => _WateryWavePageState();
}

class _WateryWavePageState extends State<WateryWavePage> {
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
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: textBoxBorderColor,
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
                        color: hintColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: textBoxBorderColor,
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
                        color: hintColor,
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
                      color: white,
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
                return MyAnimation(
                  color: myRed,
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
