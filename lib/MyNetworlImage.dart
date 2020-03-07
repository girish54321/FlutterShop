import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class MyNetWorkImage extends StatelessWidget {
  final String imageUrl;
  final String bluerCode;

  const MyNetWorkImage({Key key, this.imageUrl, this.bluerCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        height: double.infinity,
        child: BlurHash(hash: bluerCode),
      ),
      fadeInDuration: Duration(seconds: 1),
      fit: BoxFit.cover,
      height: double.infinity,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) =>
          Container(
            height: double.infinity,
            child: BlurHash(hash: bluerCode),
          )
    );
  }
}
