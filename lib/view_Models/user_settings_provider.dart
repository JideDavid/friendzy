import 'package:flutter/foundation.dart';
import '../Services/pref_helper.dart';

class UserSettingsProvider extends ChangeNotifier{

  bool isLightMode = true;
  bool balIsHidden = false;
  bool isLiveTest = false;
  List<String> interests = [];

  changeLightMode(){
    //changing theme mode
    isLightMode = !isLightMode;
    //saving theme mode to device
    PrefHelper().setThemeMode(isLightMode);
    notifyListeners();
  }

  getSavedThemeMode() async{
    //setting theme mode from last save on device
    isLightMode = await PrefHelper().getThemeMode();
    notifyListeners();
  }

  modifyInterestList(String value){
    if(interests.contains(value)){
      interests.remove(value);
    }
    else{
      interests.add(value);
    }
    notifyListeners();
  }
}