import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/utils/str.dart';
class IntroPage extends StatefulWidget{
  static final String id="intro_page";
  @override
  _IntroPageState createState()=>_IntroPageState();
}
class _IntroPageState extends State<IntroPage>{
  PageController _controller;
  int currentIndex=0;
  @override
  void initState(){
    super.initState();
    _controller=PageController(
      initialPage:0,
    );
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        elevation:0.0,
        bottomOpacity:0.0,
        backgroundColor:Colors.black,
        actions:[
          Padding(
            padding:EdgeInsets.only(left:20,right: 15,top:18),
            child:GestureDetector(
              onTap:()async{
                await Navigator.pushReplacementNamed(context,HomePage.id);
              },
              child:Text('skip',style:TextStyle(color:Colors.green,fontSize:20),),
            ),
          ),
        ],
      ),
      body:Stack(
        alignment:Alignment.bottomCenter,
        children:[
          PageView(
            onPageChanged:(int index){
              setState((){
                currentIndex=index;
              });
            },
            controller:_controller,
            children:[
              makePage(
                image:'assets/images/image_1.png',
                title:Str.stepOneTitle,
                content:Str.stepOneContent,
              ),
              makePage(
                image:'assets/images/image_2.png',
                title:Str.stepTwoTitle,
                content:Str.stepTwoContent,
              ),
              makePage(
                image:'assets/images/image_3.png',
                title:Str.stepThreeTitle,
                content:Str.stepThreeContent,
              ),

            ],
          ),
          // SizedBox(height:50),
          Container(
            padding:EdgeInsets.only(bottom:60),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:_indicatorBuilder(),
            ),
          )
        ],
      ),
      backgroundColor:Colors.black,
    );
  }
  Widget makePage({image,title,content}){
    return Container(
      padding:EdgeInsets.only(left:50,right:50,bottom:60,),
      child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Padding(
              padding:EdgeInsets.symmetric(horizontal:20),
              child:Image.asset(image),
            ),
            SizedBox(height:10),
            Text(
              title,
              textAlign:TextAlign.center,
              style:TextStyle(
                  fontSize:30,color:Colors.green,
                  fontWeight:FontWeight.w400),
            ),
            SizedBox(height:20),
            Text(
                content,
                textAlign:TextAlign.center,
                style:TextStyle(
                    fontSize:20,color:Colors.green,
                    fontWeight:FontWeight.w400),
            ),
          ]
      ),
    );
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration:Duration(milliseconds:300),
      height: 6,
      width: isActive?30:6,
      margin:EdgeInsets.only(left:5),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(5),
        color:Colors.green,
      ),
    );
  }
  List<Widget> _indicatorBuilder(){
    List<Widget> indicators=new List();
    for(int i=0;i<3;i++){
      if(currentIndex==i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
