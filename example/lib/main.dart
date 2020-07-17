import 'package:flutter/material.dart';
import 'package:easyfooter/easyfooter.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String,Icon> icons={
    'page1': Icon(Icons.home,color: Colors.black,),
    'page2': Icon(Icons.receipt,color: Colors.black,),
    'page3': Icon(Icons.event,color: Colors.black,),
  };
  Map<String,Icon> icons2={
    'page4': Icon(Icons.contact_phone,color: Colors.black,),
    'page5': Icon(Icons.mail,color: Colors.black,),
    'page6': Icon(Icons.map,color: Colors.black,),
    'page7': Icon(Icons.add_shopping_cart,color: Colors.black,),
  };
  List<Widget> pages = [

    Page1(
      key: PageStorageKey('page1'),
    ),
    Page2(
      key: PageStorageKey('page2'),
    ),
    Page3(
      key: PageStorageKey('page3'),
    ),
  ];
  List<Widget> pages2 = [

    Page4(
      key: PageStorageKey('page4'),
    ),
    Page5(
      key: PageStorageKey('page5'),
    ),
    Page6(
      key: PageStorageKey('page6'),
    ),
    Page7(
      key: PageStorageKey('page7'),
    ),

  ];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: BottomNavigationBarController.id,
      routes: {

        BottomNavigationBarController.id :(context)=> BottomNavigationBarController(ListPage: this.pages,mainSettPage: this.icons,
            MoreListPage: this.pages2,secondSetPage: this.icons2, styleOpen:1),

      },
    );
  }

}
class  Page1 extends StatefulWidget {
  const Page1({
    Key key,
    this.color = const Color(0xFFFFE306),

  }) : super(key: key);
  static const String id = "page1";
  final Color color;


  _Page1 createState() => _Page1();
}

class  _Page1 extends State<Page1> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }
  Color c=Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: (){
          setState(() {
            if( c==Colors.green)
              c=Colors.blueGrey;
            else
              c=Colors.green;
          });
        },
        child: Container(
          color: c,
          transform: Matrix4.diagonal3Values(_size, _size, 1.0),
          child: Text('page1', style: TextStyle(
            fontSize: 50,
          ),),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({Key key}) : super(key: key);
  static const String id = "page2";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page2',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}
class Page3 extends StatelessWidget {
  Page3({Key key}) : super(key: key);
  static const String id = "page3";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page3',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}
class Page4 extends StatelessWidget {
  Page4({Key key}) : super(key: key);
  static const String id = "page4";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page4',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}
class Page5 extends StatelessWidget {
  Page5({Key key}) : super(key: key);
  static const String id = "page5";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page5',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}

class Page6 extends StatelessWidget {
  Page6({Key key}) : super(key: key);
  static const String id = "page6";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page6',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}

class Page7 extends StatelessWidget {
  Page7({Key key}) : super(key: key);
  static const String id = "page7";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page7',style: TextStyle(
        fontSize: 50,
      ),),
    );
  }
}