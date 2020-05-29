import 'package:flutter/material.dart';
import 'package:flutter_news_app/bimby/screen/homepage.dart';

class ListaClienti extends StatefulWidget{
  @override
  _ListaClienti createState() => _ListaClienti();

}

class _ListaClienti extends State<ListaClienti> {
  @override
   Widget build(BuildContext context){
     return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset('assets/images/bimby.png', height: 20,)),
            Expanded(child: Align(alignment: Alignment.center ,child:Text('CLIENTI'))),
            Container(child: IconButton(
                icon: Text('', style: TextStyle(color: Colors.black, fontSize: 30)), 
                onPressed: null
              )),
            Container(child: IconButton(icon: 
                  Text('', style: TextStyle(color: Colors.black, fontSize: 30)), 
                  onPressed: () {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BimbyHomePage()));
                  }
              ))
          ]
          )
      ),
      body: SingleChildScrollView(
        child: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: List.generate(30, (index) {
              return Row(children: <Widget>[
                      Expanded(child: 
                        Card(
                          elevation: 1.0,
                          child:
                            Column(
                              children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 11.0, right: 11.0, top: 10.0), 
                                child:Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  Text('', style: TextStyle(color: Colors.green, fontSize: 20)),
                                  Expanded(child: Column(children: <Widget>[
                                    Text('Name surname ${index}', textAlign: TextAlign.left, style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    Text('Via *****, 20140 Milano', textAlign: TextAlign.left, style: TextStyle(fontSize: 11))
                                  ])),
                                  Text('', style: TextStyle(color: Colors.green, fontSize: 20) )
                                ])
                              ),
                              Row(
                                children: <Widget>[
                                SlotBordered('Ult.mod', 'TM5'),
                                SlotBordered('Ult.acquisto', '21.12.2019'),
                                SlotBordered('Tipo ult.cont.', 'Demo'),
                                SlotBordered('Ult. contatto.', '12 gg fa')
                              ]),
                              Row(
                                children: <Widget>[
                                  ClientIcons('', 1),
                                  ClientIcons('', 1),
                                  ClientIcons('', 1),
                                  ClientIcons('', 1),
                                  ClientIcons('', 2)
                                ]
                              )

                        ])
                      )
                      )
              ]);
            })
          )
        )
      ) 
    ));
   }
}

class SlotBordered extends StatelessWidget{
  final String label;
  final String value;

  SlotBordered(this.label, this.value);

  @override
  Widget build(BuildContext context){
    return Expanded(child:Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300])
      ),
      child: Column(
        children: <Widget>[
            Text(this.label, style: TextStyle(fontSize: 11)),
            Text(this.value, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))
        ])
    )
    );
  }
}


class ClientIcons extends StatelessWidget{
  final String icon;
  final int flex;

  ClientIcons(this.icon, this.flex);

  @override
  Widget build(BuildContext context){
    return Expanded(
      flex: flex,
      child: Padding(padding: EdgeInsets.all(1.0),
        child: Container(
          color: Colors.grey[200],
          child: Text(icon, textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontSize: 22))))
    );
  }
}