import 'package:eventichs_flutter/entities/event.dart';
import 'package:eventichs_flutter/myAppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailEventClient extends StatefulWidget {
  const DetailEventClient({super.key, required this.event});
  final Event event;

  @override
  State<StatefulWidget> createState() => _DetailEventClientState();
}

class _DetailEventClientState extends State<DetailEventClient> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
        body: ListView(children: [
SafeArea(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(left: 16), // Adjust the left margin as needed
        child: Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      Image(
        image: AssetImage("assets/images/eventichs_logo_transparent.png"),
        height: 100,
        width: 80,
      ),
      Container(
        margin: EdgeInsets.only(right: 16), // Adjust the right margin as needed
        child: Icon(
          Icons.favorite,
          size: 30,
        ),
      ),
    ],
  ),
),

          
      ]
    )
    );
  }
}
