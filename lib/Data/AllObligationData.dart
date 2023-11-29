import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/Obligation_allergy.dart';


class AllObligationData{

  List<bool> Boo = [];
  List<String> IndexValue = ["えび","かに","くるみ","小麦","そば","卵","乳","落花生",];
  List<String> CheckValue = [];

  void setObligationBool(List<bool> box){
    Boo.addAll(box);
  }

  void HanteiObligation(){
    for(int x = 0;x < Boo.length; x++){
      if(Boo[x] == true){
        CheckValue.add(IndexValue[x]);
      }
    }
    debugPrint(CheckValue.toString());
  }

  List<String> getCheckValue(){
    return CheckValue;
  }
}