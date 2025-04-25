import 'package:flutter/material.dart';
import '/model/places.dart';
import '/screen/place_detail.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});
  final List<Places> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(child: Text('No places are added'));
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder:
          (cxt, index) => ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            // subtitle: Text(
            //   places[index].location.address,
            //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //     color: Theme.of(context).colorScheme.onBackground,
            //   ),
            // ),
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => PlaceDetail(place: places[index]),
                  ),
                ),
          ),
    );
  }
}
