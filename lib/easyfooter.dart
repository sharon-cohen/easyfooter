library easyfooter;

import 'package:flutter/material.dart';

class BottomNavigationBarController extends StatefulWidget {
  static String id = "BottomNavigationBarController";
   List<Widget> ListPage;
   final int styleOpen;
   final List<Widget> MoreListPage;
   final Map<String,Icon> mainSettPage;
   final Map<String,Icon> secondSetPage;
   final Color backroundColorOne;
   final Color backroundColorTwo;
   final Color AftertapColor;
   final Color BeforetapColor;
   final bool ExtraIcons;
   BottomNavigationBarController({
     this.ListPage,
     this.styleOpen=0,
     this.secondSetPage,
     this.MoreListPage,
     this.AftertapColor=Colors.black,
     this.BeforetapColor=Colors.grey,
     this.mainSettPage,
     this.backroundColorTwo=Colors.white,
     this.backroundColorOne=Colors.white,
     this.ExtraIcons=true}):
         assert(ListPage.length==mainSettPage.length, 'the icons map length!= page list length'),
         assert(ListPage.isNotEmpty,  'empty list page'),
         assert(MoreListPage.isNotEmpty && ExtraIcons==true && secondSetPage.isNotEmpty,  'exstre icons need 2 list of pages'),
         assert(ListPage.length<6, 'the length of ListPage need to be <6 '),
         assert(MoreListPage.length==secondSetPage.length, 'the icons map length!= page list length'),
         assert(ListPage.isNotEmpty, 'empty list of page'),
         assert(mainSettPage.isNotEmpty, 'empty list of icons');
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}
class  _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {

  final PageStorageBucket bucket = PageStorageBucket();
  var newmap;

  int _selectedIndex=0;
  List<String> newlist=[];
  List<String> newlist2=[];
  List<String> namepage=[];
  void displayBottomSheet(BuildContext context) {

    showModalBottomSheet(
        backgroundColor: widget.backroundColorTwo,
        context: context,
        builder: (builder) {
          return Container(
            child: Wrap(
              children: listpage2(),
            ),
          );
    }
    );
  }

  void initvale(String id) {
  print(namepage);
    print(id);
   var index=namepage.indexOf(id);
   print('index');
   print(index) ;
   _selectedIndex=index;
  }

  List<PopupMenuItem<int>>listpage2(){
    int i=widget.mainSettPage.length;
    List<PopupMenuItem<int>> list=[];
    widget.secondSetPage.forEach((k, v) {
     print(i);
      list.add( PopupMenuItem<int>(
        value: i,
        child: FlatButton(
          child: Column(
            children: [
              Row(
                children: [
                  v,
                  Text(' $k',style: TextStyle(
                   color:widget.AftertapColor,
                  ),),
                ],
              ),
            ],
          ),
          onPressed: (){

            setState(() {
              initvale('$k');
            });
          },
        ),
      ),
      );
    i++;
    });
 return list;
  }
  BottomNavigationBarType stylebutton(){

      return BottomNavigationBarType.shifting;

  }
   List<BottomNavigationBarItem> getbutton(Map<String,Icon> icon, bool open){
     List<BottomNavigationBarItem> items=[];
     if(widget.ExtraIcons==true && open==false){
       items.add( BottomNavigationBarItem(
           icon: Icon(Icons.add,color: Colors.black,) ,title: Text('more') ));
     }
    icon.forEach((k, v) {
       items.add( BottomNavigationBarItem(
           icon: v ,title: Text('$k') ));
     });

     return items;

    }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    currentIndex: selectedIndex,
    unselectedItemColor: widget.BeforetapColor,
    selectedItemColor: widget.AftertapColor,
    backgroundColor:widget.backroundColorOne,
    type: BottomNavigationBarType.fixed,
    onTap: (int index) async {

      if(widget.ExtraIcons==true && index == 0){
        if(widget.styleOpen==1){
          displayBottomSheet(context);
        }
        else{

          await showMenu<int>(
          context: context,
          position: RelativeRect.fromLTRB(1000.0,MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, 1000),
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              )),
          items: listpage2(),

          elevation: 1,
          color: Colors.grey,
        );
        }

      }
      setState(() {
        if(index != 0 && widget.ExtraIcons==true)
          _selectedIndex = index-1;
      else
          _selectedIndex = index;

      }
      );
    },
    items: getbutton(widget.mainSettPage,false),

  );

  int buttonlight(){

    if(widget.ExtraIcons==true) {
      if (_selectedIndex < widget.ListPage.length) {
        return _selectedIndex + 1;
      }
      else
        return 0;
    }
    else{
      print(_selectedIndex);
      return _selectedIndex;
    }


  }
  void checkerror(){
    if(widget.ExtraIcons==true){
      if(widget.secondSetPage.isEmpty || widget.MoreListPage.isEmpty){
        throw('if you want ExtraIcons need sent map icons2 and MoreListPage');
      }

    }
  }
  @override
  void initState() {
    super.initState();
    checkerror();
    if(widget.ExtraIcons==true) {
      newmap = widget.ListPage + widget.MoreListPage;
    }
    else{
      newmap = widget.ListPage;
    }
    newlist=widget.secondSetPage.entries.map((e) => (e.key)).toList();
    newlist2=widget.mainSettPage.entries.map((e) => (e.key)).toList();
    namepage=newlist2+newlist;
    // you have a valid context here

  }


  Widget build(BuildContext context) {

    return Scaffold(
    bottomNavigationBar: _bottomNavigationBar( buttonlight()),
      body: IndexedStack(
        index: _selectedIndex,
        children: newmap,
      ),
    );
  }
}





