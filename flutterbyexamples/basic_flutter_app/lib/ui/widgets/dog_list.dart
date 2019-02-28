import 'package:flutter/material.dart';

// Model
import '../../model/dog_model.dart';

// Card
import './dog_card.dart';

class DogList extends StatelessWidget {
  List<Dog> doggos;

  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (BuildContext context, int index) {
        return DogCard(
          dog: doggos[index],
        );
      },
    );
  }
}