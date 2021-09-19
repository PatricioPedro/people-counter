import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
    title: "Contador de pessoas",
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _total_people = 0;
  String _info_restaurant = "Pode Entrar";
  void _removePeople() {
    setState(() {
      this._total_people--;
      _getInfoRestaurant();
    });
  }

  void _incrementPeople() {
    setState(() {
      if (this._total_people < 10) this._total_people++;
      _getInfoRestaurant();
    });
  }

  void _getInfoRestaurant() {
    if (this._total_people >= 10) {
      _info_restaurant = "Restaurante cheio!!";
    } else {
      if (this._total_people < 0) {
        _info_restaurant = "Mundo Invertido";
      } else {
        _info_restaurant = "Pode entrar!!";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pessoas: $_total_people",
                style: TextStyle(color: Colors.white, fontSize: 50.0)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                child: FlatButton(
                  onPressed: () {
                    this._removePeople();
                  },
                  child: Text("-1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                      )),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _incrementPeople();
                  },
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 50.0),
                  ))
            ]),
            Text(
              this._info_restaurant,
              style: TextStyle(color: Colors.white, fontSize: 30.2),
            )
          ],
        )
      ],
    ));
  }
}
