import 'package:flutter/material.dart';

// util
import '../../utils/dog_image_util.dart';

// model
import '../../model/dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard({Key key, @required this.dog}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  String renderUrl;

  @override
  void initState() {
    super.initState();
    setImageUrl();
  }

  void setImageUrl() async {
    widget.dog.imageUrl = await getDogImageUrl();

    setState(() {
      renderUrl = widget.dog.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50.0,
            child: dogCard,
          ),
          Positioned(
            top: 7.5,
            child: dogImage,
          ),
        ],
      ),
    );
  }

  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(renderUrl ?? ''),
          )),
    );
  }

  Widget get dogCard {
    return Container(
      width: 350.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.dog.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Text(': ${widget.dog.rating} / 10'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
