import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';

Widget hiddenLetter(String char,bool visible){
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white,),
    child: Visibility(
      visible: !visible,
      child: Text(char,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: AppColors.bgColor),)),
  );
}