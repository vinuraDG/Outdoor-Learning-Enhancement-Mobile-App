import 'package:flutter/material.dart';
import 'discussions/discussions_screen.dart';
import 'trip_stories/trip_stories_screen.dart';
import 'events/events_screen.dart';
import 'find_partners/find_partners_screen.dart';

/// Routes a CommunityItem to its dedicated sub-screen.
class CommunityDetailScreen extends StatelessWidget {
  final dynamic item;

  const CommunityDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.id as String) {
      case 'discussions':
        return const DiscussionsScreen();
      case 'trip_stories':
        return const TripStoriesScreen();
      case 'events':
        return const EventsScreen();
      case 'find_partners':
        return const FindPartnersScreen();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(item.title as String),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: const Center(child: Text('Coming soon')),
        );
    }
  }
}
