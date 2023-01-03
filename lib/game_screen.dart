

import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letter.dart';
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "deepak".toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hangman: The Game"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        
      ),
body: Column(children: [
  Expanded(
    flex: 3,
    child: Column(children: [
      Expanded(
        flex: 4,
        child: Stack(
         children:[
          figure(GameUI.hanger, tries >=0),
          figure(GameUI.hed, tries >=1,),
          figure(GameUI.body, tries >=2),
          figure(GameUI.leftArm, tries >=3),
          figure(GameUI.rightArm, tries >=4),
          figure(GameUI.leftLeg, tries >=5),
          figure(GameUI.rightLeg, tries >=6),
         ] ,
          )),
      Expanded(
        
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:word.split("").map((e) => hiddenLetter(e,!selectedChar.contains(e.toUpperCase()))).toList(),) ,
         )),
    ],)),


  Expanded(
    flex: 2,
    child:
   Container(
    padding: EdgeInsets.all(8.0),
   
    child: GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 7,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    children: characters.split("").map((e){
      return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
        onPressed:selectedChar.contains(e.toUpperCase())?null: (){
          setState(() {
            selectedChar.add(e.toUpperCase());
            if(!word.split("").contains(e.toUpperCase())){
              tries++;

            }
          });


        }, child: Text(e,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
    }).toList(),
    ),
    ))
],),    );
  }
}