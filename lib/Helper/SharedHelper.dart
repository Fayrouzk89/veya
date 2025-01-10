import 'dart:io';

import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../Api/network/app_api.dart';
import '../Api/network/dio_factory.dart';
import '../Api/network/network_info.dart';
import '../Api/network/remote_data_source.dart';
import '../Api/network/repository.dart';
import '../Api/network/repository_imp.dart';
import '../UseCase/SharedUseCase.dart';
import 'LocalDataHelper.dart';
import 'PreferenceSettingsHelper.dart';
class SharedHelper
{
  static var dIinstance = GetIt.instance;


  static Future<PreferenceSettingsHelper> getHelper()async
  {
    if(GetIt.I.isRegistered<PreferenceSettingsHelper>())
    {
      PreferenceSettingsHelper preferenceSettingsHelper=dIinstance.get<PreferenceSettingsHelper>();
      return preferenceSettingsHelper;
    }
    else
    {
      PreferenceSettingsHelper preferenceSettingsHelper =PreferenceSettingsHelper(sharedPreferences:SharedPreferences.getInstance());
      dIinstance.registerLazySingleton<PreferenceSettingsHelper>(() => preferenceSettingsHelper);
      return preferenceSettingsHelper;
    }
  }

  static initSharedUseCase()async{

    // if registered once in the app we needn't a lot
    if(!GetIt.I.isRegistered<SharedUseCase>()){
      // dIinstance.registerFactory<ImportUseCase>(() => ImportUseCase(dIinstance()));
      dIinstance.registerLazySingleton<SharedUseCase>(() =>SharedUseCase(dIinstance()));
    }
  }


  static Future<void> initAppModule(String ser)async{
    PreferenceSettingsHelper preferenceSettingsHelper=await getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    await loadLang(sharedPreferences);
    await LocalDataHelper.loadUser(sharedPreferences);
    if (GetIt.instance.isRegistered<SharedPreferences>()) {
      GetIt.instance.unregister<SharedPreferences>();
    }
    dIinstance.registerLazySingleton<SharedPreferences>(() =>sharedPreferences);
    if (GetIt.instance.isRegistered<NetworkInfo>()) {
      GetIt.instance.unregister<NetworkInfo>();
    }
    dIinstance.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(kIsWeb?null:InternetConnectionChecker()));
    // dio factory
    if (GetIt.instance.isRegistered<DioFactory>()) {
      GetIt.instance.unregister<DioFactory>();
    }
    dIinstance.registerLazySingleton<DioFactory>(() => DioFactory());
    Dio dio = await dIinstance<DioFactory>().getDio();
    String serverIp=sharedPreferences.getString("serverIP")??"";
    if (GetIt.instance.isRegistered<AppServicesClient>()) {
      GetIt.instance.unregister<AppServicesClient>();
    }
    if(ser=="") {
      dIinstance.registerLazySingleton<AppServicesClient>(() =>
          AppServicesClient(dio, serverIp));
    }
    else {
      dIinstance.registerLazySingleton<AppServicesClient>(() =>
          AppServicesClient(dio, ser));
    }
    // remote data source
    if (GetIt.instance.isRegistered<RemoteDataSource>()) {
      GetIt.instance.unregister<RemoteDataSource>();
    }
    dIinstance.registerLazySingleton<RemoteDataSource>(
            () => RemoteDataSourceImp(dIinstance<AppServicesClient>()));

    // repository
    if (GetIt.instance.isRegistered<Repository>()) {
      GetIt.instance.unregister<Repository>();
    }
    dIinstance.registerLazySingleton<Repository>(
            () => RepositoryImp(dIinstance(), dIinstance()));
    if (GetIt.instance.isRegistered<RemoteDataSource>()) {
      GetIt.instance.unregister<RemoteDataSource>();
    }
    dIinstance.registerLazySingleton<RemoteDataSource>(() =>RemoteDataSourceImp(dIinstance<AppServicesClient>()) );
    //dIinstance.registerSingleton<RemoteDataSource>(RemoteDataSourceImp(dIinstance<AppServicesClient>()));
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
          lang="en";
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
  static changeServerIP(String serverIp,bool reset)async
  {
    print("server Ip "+serverIp);
    if(reset) {
      await dIinstance.reset();
      await initAppModule(serverIp);
    }
  }


}