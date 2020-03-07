import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_rating/flutter_rating.dart';

import 'MyNetworlImage.dart';

class TrandingView extends StatelessWidget {
  final String image;
  final String bluerCode;

  const TrandingView({Key key, this.image, this.bluerCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    return Container(
//      width: 180,
//      height: 200,
//      child: Card(
//        child: Column(
//          children: <Widget>[Text("Card")],
//        ),
//      ),
//    );
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context)=> Details(detail: data[index]))
//          );
          },
          child: Container(
//            height: 230.0,
              width: 200.0,
//              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8.0)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
//                                child: CachedNetworkImage(
//                                    placeholder: (context, url) => BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I"),
//                                  fadeInDuration: Duration(seconds: 1),
//                                  fit: BoxFit.cover,
//                                  height: double.infinity,
//                                  imageUrl: image,
//                                  errorWidget: (context, url, error) =>
//                                      Icon(Icons.error),
//                                )
                            child: MyNetWorkImage(imageUrl: image,bluerCode: bluerCode,),
//                               : BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I")
//                            child: Image.network("",fit: BoxFit.contain,),
                                ),
                          ),
//                          Container(
//                            child: 1 == 1
//                                ? Icon(
//                                    Icons.favorite,
//                                    size: 20.0,
//                                    color: Colors.red,
//                                  )
//                                : Icon(
//                                    Icons.favorite_border,
//                                    size: 20.0,
//                                  ),
//                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new StarRating(
                            size: 15.0,
                            rating: 3.3,
                            color: Colors.orange,
                            borderColor: Colors.grey,
                            starCount: 5),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
//                        child: Text("\$${data[index].price.toString()}",style: TextStyle(fontWeight: FontWeight.w500),),
                          child: Text(
                            "\$${20}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
