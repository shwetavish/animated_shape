import 'package:flutter/material.dart';

import 'design_widgets/circular_chart/ui/circular_chart_page.dart';
import 'design_widgets/watery_wave/ui/watery_wave_page.dart';

class DesignWidgetList extends StatelessWidget {
  const DesignWidgetList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const WateryWavePage(title: 'Watery Wave'),
                      ),
                    );
                  },
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                      child: Text(
                        'Watery Wave',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CircularChartPage(title: 'Circular Chart'),
                      ),
                    );
                  },
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                      child: Text(
                        'Circular Chart',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
