import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
        width: sizeX,
        height: sizeY,
        child: ListView(
          children: showContacts(),
        ));
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = List<Widget>();
    squares.add(Container(color: Colors.black));
    while (i < numSquares) {
      Container square = Container(
        color: colors[i % 5],
        width: 100.0,
        height: 100.0,
        child: Text(i.toString()),
      );
      i++;
      squares.add(square);
    }
    return squares;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    Container square = Container(
      color: colors[position % 5],
      width: 100.0,
      height: 100.0,
      child: Text(position.toString()),
    );
    return square;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black,
    );
    return separator;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = List<Widget>();
    Container backGround = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('http://bit.ly/pizzaimage'),
            fit: BoxFit.fitHeight),
      ),
    );
    layoutChildren.add(backGround);
    Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 20,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: <Widget>[
            Text(
              'Pizza Margherita',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[800]),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'This delicious pizza is made of Tomato, \nMozzarella, and Basil. \n\n Seriously you can\'t miss it',
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
            )
          ],
        ),
      ),
    );
    layoutChildren.add(pizzaCard);
    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: RaisedButton(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.orange[900],
        child: Text('Order Now!',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onPressed: () {},
      ),
    );
    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }

  List<Contact> buildContacts() {
    List<Contact> contacts = List<Contact>();
    contacts.add(
        Contact('Sami Al-Jamal', 'Brown Bear', Icons.sentiment_very_satisfied));
    contacts.add(Contact('Molly New', 'Bumble', Icons.sentiment_satisfied));
    contacts.add(Contact('Chelsea Molina', 'Ocho', Icons.sentiment_satisfied));
    contacts.add(Contact('William Molina', 'Bear', Icons.sentiment_satisfied));
    contacts.add(Contact(
        'Margaret Al-Jamal', 'Mama Meg', Icons.sentiment_very_dissatisfied));
    contacts.add(
        Contact('Mahmoud Al-Jamal', 'Abu Sami', Icons.sentiment_dissatisfied));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }
    List<ListTile> list = List<ListTile>();
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.nickname),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber[600],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
        onTap: () => true,
      ));
    });
    return list;
  }
}

class Contact {
  String name;
  String nickname;
  IconData icon;
  Contact(this.name, this.nickname, this.icon);
}
