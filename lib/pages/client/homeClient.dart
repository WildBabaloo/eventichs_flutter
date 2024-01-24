import 'package:eventichs_flutter/entities/event.dart';
import 'package:eventichs_flutter/myAppState.dart';
import 'package:eventichs_flutter/pages/client/detailEventClient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({super.key});

  @override
  State<HomeClient> createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  final controller = TextEditingController();
  List<Event> events = MyAppState().events;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: ListView(
          children: [
            const SafeArea(
                child: Image(
                    image: AssetImage(
                        "assets/images/eventichs_logo_transparent.png"),
                    height: 100,
                    width: 80)),
            Center(
              child: ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: const ["List", "Map"],
                onToggle: (index) => print('Switched to: $index'),
                animate: true,
                curve: Curves.bounceInOut,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Event Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                onChanged: searchEvent,
              ),
            ),
            for (var event in events)
              Container(
                child: Card(
                  elevation: 10,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DetailEventClient(event: event)
                          )
                        );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(event.name),
                          subtitle: Text(event.description),
                          trailing: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
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
            )));
  }

  void searchEvent(String query) {
    final suggestions = MyAppState().events.where((event) {
      final eventName = event.name.toLowerCase();
      final input = query.toLowerCase();

      return eventName.contains(input);
    }).toList();

    setState(() {
      events = suggestions;
    });
  }
}
