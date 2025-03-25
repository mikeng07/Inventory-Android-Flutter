import'package:flutter/material.dart';
import 'package:flutterdemoapp/item.dart';


class ItemPage extends StatefulWidget {
  final Item item;

  ItemPage({Key key, @required this.item}):super(key:key);
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState  extends State<ItemPage> {

  void IncreaseItem() {

    setState((){

      widget.item.count+=1;

    });

  }
  void DecreaseItem() {

    setState((){

      widget.item.count-=1;

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Item Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(

            flex: 20,
            child: Text('',
            ),
          ),


          Expanded(

            flex: 20,
            child: Text("${widget.item.name}",
                style:  TextStyle(
                color: Colors.grey[800],

                fontSize: 50)),
          ),

          Expanded(

            flex: 20,
            child: Text("${widget.item.count}",
            style:  TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 50)
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Container(
                margin: EdgeInsets.all(20),

                  child: RaisedButton(



                    child:Text('plus'),
                    onPressed: (){
                      IncreaseItem();


                    },
                  ),
                ),

              Container(
                margin: EdgeInsets.all(20),
                  child: RaisedButton(


                    child:Text('minus'),
                    onPressed: (){
                      DecreaseItem();


                    },
                  ),
                ),



            ],
          ),

          Expanded(

            flex: 20,
            child: Text('',
              style:  Theme.of(context).textTheme.headline4,),
          ),

        ],
      )
      ),
    );
  }
  }

