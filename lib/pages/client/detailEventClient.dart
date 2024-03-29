import 'package:eventichs_flutter/entities/event.dart';
import 'package:eventichs_flutter/myAppState.dart';
import 'package:eventichs_flutter/pages/client/chatGPTAPITest.dart';
import 'package:eventichs_flutter/pages/client/googleMapAPITest.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:map_launcher/map_launcher.dart';

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
    var eventHostName = widget.event.eventHost.organisationName;
    var startTime = widget.event.startTime;
    var endTime = widget.event.endTime;
    var locationEvent = widget.event.location;
    var numberAttendies = widget.event.attendies.length;
    var eventAddress = widget.event.location;
    var descriptionEvent = widget.event.description;
    var selectedIndex = 0;
    return Scaffold(
        body: Column(children: [
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
                  image: AssetImage(
                      "assets/images/eventichs_logo_transparent.png"),
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
          Center(
              child: Text(
            widget.event.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )),
          const Divider(),
          Row(
            children: [
              const Icon(
                Icons.person,
              ),
              Flexible(child: Text(" By: $eventHostName")),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.group,
              ),
              Flexible(
                  child: Text(" $numberAttendies people going to this event")),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(
                Icons.schedule,
              ),
              Flexible(child: Text(" Start: $startTime")),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.schedule,
              ),
              Flexible(child: Text(" End: $endTime")),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(
                Icons.location_on,
              ),
              Flexible(child: Text(" Location: $locationEvent")),
            ],
          ),
          ElevatedButton(
              onPressed: () => mapLaunch(eventAddress), child: const Text("View in maps app")
            ),
        const Divider(),
        Row(
            children: [
              const Icon(
                Icons.description,
              ),
              Flexible(child: Text(" Description: $descriptionEvent")),
            ],
          ),
        const Divider()
        ],),

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
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                    if (selectedIndex == 2) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const GoogleMapAPITest(),
                          ),
                        );
                    }
                    if (selectedIndex == 1) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const ChatGPTAPITest(),
                          ),
                        );
                    }
                  });
                },
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.person_2,
                    text: 'Ai Assistant',
                  ),
                  GButton(
                    icon: Icons.map,
                    text: 'Map',
                  ),
                  GButton(icon: Icons.account_circle, text: 'Profil')
                ],
              ),
            )));
  }

  void mapLaunch(String address) async {
    List<Location> locations = await locationFromAddress(address);
    final latitude = locations[0].toString();
    print(latitude);
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
        coords: Coords(45.55235416852877, -73.55588160712402),
        title: "Ocean Beach",
        zoom: 50);
  }
}
