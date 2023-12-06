import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/Obligation_allergy.dart';


class AllObligationData{

  static List<bool> Boo = [];
  static List<String> IndexValue = ["えび","かに","くるみ","小麦","そば","卵","乳","落花生",];
  static List<String> CheckValue = [];
  static String HObligation = "";

  void setObligationBool(List<bool> box){
    Boo.clear();
    Boo.addAll(box);
  }

  void HanteiObligation(){
    CheckValue.clear();
    for(int x = 0;x < Boo.length; x++){
      if(Boo[x] == true){
        CheckValue.add(IndexValue[x]);
      }
    }
    debugPrint(CheckValue.toString());
  }

  String getCheckValue(){
    HObligation = "";
    for(int x = 0;x < CheckValue.length; x++){
      if(x == 0 || x == CheckValue.length){
        HObligation = '$HObligation${CheckValue[x]}';
      }else{
        HObligation = '$HObligation\n${CheckValue[x]}';
      }
    }
    debugPrint(HObligation);
    return HObligation;
  }

  void AllResetObligation(){
    Boo = [];
    CheckValue = [];
    HObligation = "";
  }
}