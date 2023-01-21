import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({Key? key,required this.title}) : super(key: key);

  final String title;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.09,
        title: InkWell(
          onTap: () {
            // method to show the search bar
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
            );
          },
          child:
          Container(
            margin: EdgeInsets.all(7),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.06,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black,),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Center(
              child: Text(
                "Search your product here",
                style: TextStyle(color: Colors.black45, fontSize: 15),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5,top: 10),
                  child: Text(
                    "Recent Searches",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.auto_mode),
                  title: const Text('Text'),
                  trailing: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.clear)),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}







//
// import 'package:dio/dio.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
// //Step 3
//   _HomeScreenState() {
//     _filter.addListener(() {
//       if (_filter.text.isEmpty) {
//         setState(() {
//           _searchText = "";
//           filteredNames = names;
//         });
//       } else {
//         setState(() {
//           _searchText = _filter.text;
//         });
//       }
//     });
//   }
//
// //Step 1
//   final TextEditingController _filter = new TextEditingController();
//   final dio = new Dio(); // for http requests
//   String _searchText = "";
//   List names = []; // names we get from API
//   List filteredNames = new List(); // names filtered by search text
//   Icon _searchIcon = new Icon(Icons.search);
//   Widget _appBarTitle = new Text('Search Example');
//
//   //step 2.1
//   void _getNames() async {
//     final response =
//     await dio.get('https://jsonplaceholder.typicode.com/users');
//     print(response.data);
//     List tempList = new List();
//     for (int i = 0; i < response.data.length; i++) {
//       tempList.add(response.data[i]);
//     }
//     setState(() {
//       names = tempList;
//       filteredNames = names;
//     });
//   }
//
// //Step 2.2
//   void _searchPressed() {
//     setState(() {
//       if (this._searchIcon.icon == Icons.search) {
//         this._searchIcon = new Icon(Icons.close);
//         this._appBarTitle = new TextField(
//           controller: _filter,
//           decoration: new InputDecoration(
//               prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
//         );
//       } else {
//         this._searchIcon = new Icon(Icons.search);
//         this._appBarTitle = new Text('Search Example');
//         filteredNames = names;
//         _filter.clear();
//       }
//     });
//   }
//
//   //Step 4
//   Widget _buildList() {
//     if (!(_searchText.isEmpty)) {
//       List tempList = new List();
//       for (int i = 0; i < filteredNames.length; i++) {
//         if (filteredNames[i]['name']
//             .toLowerCase()
//             .contains(_searchText.toLowerCase())) {
//           tempList.add(filteredNames[i]);
//         }
//       }
//       filteredNames = tempList;
//     }
//     return ListView.builder(
//       itemCount: names == null ? 0 : filteredNames.length,
//       itemBuilder: (BuildContext context, int index) {
//         return new ListTile(
//           title: Text(filteredNames[index]['name']),
//           onTap: () => print(filteredNames[index]['name']),
//         );
//       },
//     );
//   }
//
//   //STep6
//   Widget _buildBar(BuildContext context) {
//     return new AppBar(
//       centerTitle: true,
//       title: _appBarTitle,
//       leading: new IconButton(
//         icon: _searchIcon,
//         onPressed: _searchPressed,
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     _getNames();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildBar(context),
//       body: Container(
//         child: _buildList(),
//       ),
//       resizeToAvoidBottomPadding: false,
// //      floatingActionButton: FloatingActionButton(
// //        onPressed: _postName,
// //        child: Icon(Icons.add),
// //      ),
//     );
//   }
// }
//









