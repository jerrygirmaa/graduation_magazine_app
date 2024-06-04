import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  late String image;
  ViewImage(this.image, {Key, key}) : super(key: key);
  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            margin: const EdgeInsets.only(bottom: 5, top: 7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: CachedNetworkImage(
                imageUrl: widget.image,
                placeholder: (context, url) => Container(
                  height: _w - 20,
                  width: _w,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 196, 233),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )),
      ),
    );
  }
}
