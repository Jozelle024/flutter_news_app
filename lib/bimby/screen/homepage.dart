import 'package:flutter/material.dart';

class BimbyHomePage extends StatefulWidget {
  @override
  _BimbyHomePage createState() => _BimbyHomePage();
}

class _BimbyHomePage extends State<BimbyHomePage>{
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
            Expanded(child: Align(alignment: Alignment.center ,child:Text('HOME'))),
            Container(child: IconButton(
                icon: Text('', style: TextStyle(color: Colors.black, fontSize: 30)), 
                onPressed: null
              )),
            Container(child: IconButton(icon: 
                  Text('', style: TextStyle(color: Colors.black, fontSize: 30)), 
                  onPressed: null
              ))
          ])
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
            BimbyCard(GreetingsContainer(user: 'Jozelle'), 50),
            BimbyCard(Row(
              children: <Widget> [
                Expanded(child:
                Padding(padding: EdgeInsets.all(10), child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lista Clienti',textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green) ),
                    Expanded(
                      child: Text('Accedi alla tua lista clienti, consulta i dettagli e crea la tua lista da lavorare.',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
                  )])
                )),
                Container(
                  height: 100,
                  width: 80,
                  child: IconButton(icon: Text('', style: TextStyle(color: Colors.green, fontSize: 40))
                  ) 
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                  height: 100,
                  width: 40,
                  color: Colors.green, 
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 24.0 ),
                )
                )
              ]
            ), 100    
            )
          ]
          ),
        )

      )
    );
  }
}

class BimbyCard extends StatelessWidget{
  final Widget child;
  final double height;

  BimbyCard(this.child,this.height);
 
  @override
  Widget build(BuildContext context){
    return  
      Card(
          child: Container(
            height: height,
            child: child)
      );
  }
}

class GreetingsContainer extends StatelessWidget {
  final String user; 
  GreetingsContainer({this.user});
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(10), child: 
    Row(children: <Widget> [
        Text('Ciao '),
        Text(user.toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold))
    ]));
  }
}