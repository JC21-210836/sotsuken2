import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/Obligation_allergy.dart';


class AllRecommendationData{

  List<bool> Boo2 = [];
  List<String> IndexValue2 = ["あわび","いか","いくら","オレンジ","牛肉","ごま","さけ", "さば","大豆","鶏肉",
                              "バナナ","豚肉","まつたけ","もも","やまいも","りんご","ゼラチン","アーモンド","カシューナッツ","キウイフルーツ"];

  List<String> CheckValue2 = [];

  void setRecommendationBool(List<bool> box){
    Boo2.addAll(box);
  }

  void HanteiRecommendation(){
    for(int x = 0;x < Boo2.length; x++){
      if(Boo2[x] == true){
        CheckValue2.add(IndexValue2[x]);
      }
    }
    debugPrint(CheckValue2.toString());
  }

  List<String> getCheckValue2(){
    return CheckValue2;
  }
}