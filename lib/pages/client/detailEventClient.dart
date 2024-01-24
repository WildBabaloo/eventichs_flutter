import 'package:eventichs_flutter/entities/event.dart';
import 'package:eventichs_flutter/myAppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
              margin: const EdgeInsets.only(
                  left: 16), // Adjust the left margin as needed
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            const Image(
              image: AssetImage("assets/images/eventichs_logo_transparent.png"),
              height: 100,
              width: 80,
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 16), // Adjust the right margin as needed
              child: const Icon(
                Icons.favorite,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    ]),
    bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                tabBackgroundColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.onPrimary,
                gap: 12,
                padding: const EdgeInsets.all(20),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favoris',
                  ),
                  GButton(
                    icon: Icons.add,
                    text: 'Ajouter',
                  ),
                  GButton(icon: Icons.account_circle, text: 'Profil')
                ],
              ),
            )
      )
    );
  }
}
