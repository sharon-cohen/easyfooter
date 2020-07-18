# easyfooter

With this package all you need to do is 
# just create the pages 
and the package will take care of the navigation of your application

## Getting Started

# step 1
create all your pages: statefull/stateless
EX <img width="246" alt="page 1" src="https://user-images.githubusercontent.com/62427228/87847779-4d67c880-c8e3-11ea-997a-22790083fbf6.PNG">

add for every page id name 
EX <img width="190" alt="id" src="https://user-images.githubusercontent.com/62427228/87847847-b8190400-c8e3-11ea-89ba-3adf161b784d.PNG">
# step 2
create list<Widget> for all the pages 
EX  <img width="201" alt="list pages" src="https://user-images.githubusercontent.com/62427228/87847887-f9a9af00-c8e3-11ea-87b7-6ae8ed1d0560.PNG">
* key vlaue== id vlaue  <img width="323" alt="same name" src="https://user-images.githubusercontent.com/62427228/87847988-ed722180-c8e4-11ea-861f-10eeffd23b94.PNG">

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
