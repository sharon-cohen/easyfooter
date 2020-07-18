# easyfooter- just create the pages and the package will take care of the navigation of your application
# result
![20200707_113755](https://user-images.githubusercontent.com/62427228/87848267-30cd8f80-c8e7-11ea-9b3e-67dece0cad99.gif)
![footer2](https://user-images.githubusercontent.com/62427228/87848270-34611680-c8e7-11ea-80bd-2f6c9a1c81e8.gif)
![fotter 3](https://user-images.githubusercontent.com/62427228/87848274-375c0700-c8e7-11ea-9a68-6716ad8fda32.gif)

# step 1
create all your pages: statefull/stateless
example 
```
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
```

* add for every page id name 
```
static const String id = "page2";
```
# step 2
create list<Widget> for all the pages 
example
 ```
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
  ```
* key vlaue== id vlaue 
```                                    
static const String id = "page2";    
////// EQUAL (==)///////
Page2(
      key: PageStorageKey('page2'),
    ),
 ```
 * create map<string, icon> for evrey page will be name and icon
 example
 ```
 Map<String,Icon> icons={
    'page1': Icon(Icons.home,color: Colors.black,),
    'page2': Icon(Icons.receipt,color: Colors.black,),
    'page3': Icon(Icons.event,color: Colors.black,),
  };
  ```
# step 3
main class create
``` 
Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: BottomNavigationBarController.id,
      routes: {

        BottomNavigationBarController.id :(context)=> BottomNavigationBarController(ListPage: this.pages,mainSettPage: this.icons,
            MoreListPage: this.pages2,secondSetPage: this.icons2, styleOpen:1),

      },
    );
  }
```

class style
* create one set pages/ ceate main set page and second set pages
```
# ExtraIcons: true // ExtraIcons: false (defult)
 * if  ExtraIcons:false add:
```
BottomNavigationBarController(ListPage: this.pages,mainSetPage: this.icons);
Map<String,Icon> icons={  ...  };                               
List<Widget> pages = [ ...  ];                                                   
```
 * if  ExtraIcons: true add:
```
BottomNavigationBarController(ListPage: this.pages,mainSetPage: this.icons, MoreListPage: this.pages2,secondSetPage: this.icons2,ExtraIcons: true,),
Map<String,Icon> icons={  ...  };                               
List<Widget> pages = [ ...  ];                                                   
Map<String,Icon> icons2={  ...  };                               
List<Widget> pages2 = [ ...  ];    
```
# styleOpen:1/ styleOpen:0 (defult)
BottomNavigationBarController(ListPage: this.pages,mainSetPage: this.icons, MoreListPage: this.pages2,secondSetPage: this.icons2,ExtraIcons: true,styleOpen:1,)
<img width="191" alt="open2" src="https://user-images.githubusercontent.com/62427228/87848732-928ff880-c8eb-11ea-8520-2e7667d52653.PNG">
 styleOpen:0 (defult)
<img width="201" alt="Open1" src="https://user-images.githubusercontent.com/62427228/87848737-9a4f9d00-c8eb-11ea-9dd2-268b8ed26024.PNG">
styleOpen:1
# background color 
```
final Color backroundColorOne; \\ main pages
final Color backroundColorTwo;\\ second pages
```
# icon color
```
final Color AftertapColor;
final Color BeforetapColor;
```
