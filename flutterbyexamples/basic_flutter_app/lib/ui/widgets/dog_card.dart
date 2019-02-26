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
    return dogImage;
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
}
