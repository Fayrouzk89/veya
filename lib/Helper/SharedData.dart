import 'dart:io';

import '../Helper/SharedHelper.dart';

import 'LocalDataHelper.dart';

import 'PreferenceSettingsHelper.dart';
class SharedData
{
  static Future initAppModule()async
  {
    PreferenceSettingsHelper preferenceSettingsHelper=await SharedHelper.getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    await loadLang(sharedPreferences);
  }
  static loadLang(sharedPreferences)
  {
    String lang=sharedPreferences.getString("lang")??"";
    if(lang=="")
    {
      try {
        String languageCode = Platform.localeName.split('_')[0];
        if(languageCode!=null && languageCode.contains("ar"))
        {
          lang="ar";
        }
        else
        {
          lang="ar";
        }
        LocalDataHelper.lang=lang;
      }
      catch(e)
      {}
    }
    else
    {
      LocalDataHelper.lang=lang;
    }
  }
  static saveLang(sharedPreferences,value)async
  {
    await  sharedPreferences.setString("lang", value);
    LocalDataHelper.lang=value;
    await sharedPreferences.commit();
  }
}