import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  int timeSecond=0;
  int timeMinute=0;
  int timeHour=0;
  bool key=false;

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  @override
  Widget build(BuildContext context) {
    //bool isSelected = false;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('${timeHour<10?'0':''}$timeHour:${timeMinute<10?'0':''}$timeMinute:${timeSecond<10?'0':''}$timeSecond',style: TextStyle(fontSize: 100),),
          
          TextButton.icon(onPressed: ()async{
            if(key==true){
              key=false;
              
            }
            else{
              key =true;
            }
            
            while(key){
              if(key==true){
                await Future.delayed(Duration(seconds: 1),() {
              setState(() {
                timeSecond=timeSecond+1;
                if(timeSecond==60){
                  timeMinute=timeMinute+=1;
                  timeSecond=0;
                  if(timeMinute==60){
                    timeHour=timeHour+1;
                    timeMinute=0;
                  }
                }
              });
            },);


              }
              else{
                break;
              }


            
            }
            
          }, label: Text(key==false?'شروع':'توقف',style: TextStyle(fontSize: 50,color: Colors.blue),),
          icon: Icon(key==false? CupertinoIcons.play_rectangle : CupertinoIcons.pause_circle,color: Colors.blue,size: 50,),
          ),
        ],),
      ),
    );
  }
}