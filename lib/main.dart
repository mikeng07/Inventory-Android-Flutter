import 'package:flutter/material.dart';
import 'item.dart';
import 'Item_Page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}


class _State extends State<MyApp> {
  final List<Item> items = <Item>[];


  TextEditingController nameController = TextEditingController();

  void addItemToList(){

    setState((){
     // friends.add(nameController.text);
      Item new_item = Item(nameController.text,0);
      items.insert(0, new_item);

    });

}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.deepOrange,

        title: Text('Item List',),
      ),

      body: Column(
          children: <Widget>[

            Padding(padding: EdgeInsets.all(20),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Item Name',

        ),
      ),
    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    addItemToList();
                  });
                },
              ),

              RaisedButton(
                child: Text('Delete'),
                onPressed: () {
                  setState(() {

                    items.removeAt(0);
                  });
                },
              ),

              RaisedButton(
                child: Text('refresh'),
                onPressed: () {
                  setState(() {

                  });
                },
              ),


            ],
          ),

            Expanded(
               child:ListView.builder(
              padding: const EdgeInsets.all(8),
             itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                   return ListTile(
              onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPage(item: items[index])),);
              },
                     title: Container(
                  height: 50,
                  color: Colors.orange,
                  margin: EdgeInsets.only(top:5,bottom: 5),
                      child: Row(
                    children:[
                          Container(
                        margin: EdgeInsets.only(right:20),
                      ),

                            Text
                        ('${items[index].name} ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),

                         Spacer(),
                          Container(
                          margin: EdgeInsets.only(right: 20),
                             child: Text('${items[index].count}')),


                    ],


                  )
              ),
            );
          }),

       // This trailing comma makes auto-formatting nicer for build methods.
    )

    ]
    )
    );
  }
}
