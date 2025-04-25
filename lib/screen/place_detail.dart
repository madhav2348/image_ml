import 'package:flutter/material.dart';
import '/model/places.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});

  final Places place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(
                    //   context,
                    // ).push(MaterialPageRoute(builder: (ctx) {}));
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    '',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
