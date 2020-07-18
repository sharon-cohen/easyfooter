# easyfooter

With this package all you need to do is 
# just create the pages 
and the package will take care of the navigation of your application

## Getting Started

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

 
