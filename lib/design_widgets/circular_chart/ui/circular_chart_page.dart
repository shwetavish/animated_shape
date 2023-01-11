import 'package:animated_shape/utils/app_constant.dart';
import 'package:flutter/material.dart';

import '../component/circular_chart.dart';

class CircularChartPage extends StatefulWidget {
  const CircularChartPage({super.key, required this.title});

  final String title;

  @override
  State<CircularChartPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CircularChartPage> {
  late double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            min: 0,
            max: 100,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CircularChart(
            progress: _value,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          /* Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CircularProfile(),
            ),
          );*/
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
        color: white,
        notchMargin: 7.0,
        child: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.people),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.file_copy),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.home,
                      color: myRed,
                      // color: Colors.blue,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: myRed,
                        // color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.people,
                    color: bottomBarTextIconColor,
                  ),
                  Text(
                    'Attendees',
                    style: TextStyle(
                      color: bottomBarTextIconColor,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.file_copy,
                    color: bottomBarTextIconColor,
                  ),
                  Text(
                    'Detail',
                    style: TextStyle(
                      color: bottomBarTextIconColor,
                    ),
                  ),
                ],
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
