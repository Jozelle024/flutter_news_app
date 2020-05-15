import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget{

  @override
  AnimationsTestState createState() => AnimationsTestState();
}

class AnimationsTestState extends State<AnimationTest> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: -0.25, end: 0.0).animate(
      CurvedAnimation(parent:_controller, curve: Curves.easeIn )) 
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed){
          _controller.forward();
        }
      });
    super.initState();
  }  
  var pressed = false;
  @override
  Widget build(BuildContext context){
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    _controller.forward();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, Widget child) {
            return 
              Transform(
                transform: Matrix4.translationValues(animation.value * width, animation.value * height, 0.0),
                child: 
                Center(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        pressed = !pressed;
                      });
                    },
                    child:
                    AnimatedContainer(
                      width: pressed ? 100: 300, 
                      height: pressed ? 100: 300, 
                      color: Colors.red[100],
                      duration: Duration(seconds: 2),
                    )
                  )
                )
            );
          },
        )
       )
    );
  }
}