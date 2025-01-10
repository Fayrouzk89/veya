import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import 'package:veya_club/Utils/AppFonts.dart';

import '../../Helper/ImageAssetsHelper.dart';
import '../../Utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widget/buildLoading.dart';
import 'bloc/UserInfoBloc.dart';
import 'bloc/UserInfoEvent.dart';
import 'bloc/UserInfoState.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  UserInfoBloc newsBloc=UserInfoBloc();
  @override
  void initState() {
    super.initState();
    startInit();
  }
  startInit()async
  {
    if(LocalDataHelper.userInfo!=null) {
      newsBloc.add(GetUserInfoInitial());
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onVerticalDragStart: (details) {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: whiteColorCustom,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  ImageAssetsHelper.placeholder, // Replace with your image path
                  fit: BoxFit.cover, // Ensures the image covers the full width
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(child:
              (LocalDataHelper.userInfo==null)?
                   buildTextInfo('user full name'):
                   buildBloc()
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget buildTextInfo(String title) {
    return Text(title,style: AppFonts.fontBoldLarge,);
 }

 Widget buildBloc()
 {
   return  BlocProvider(
     lazy: false,
     create: (_) => newsBloc,
     child: BlocListener<UserInfoBloc, UserInfoState>(
       listener: (context, state) {
         if (state is UserInfoError) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text(state.message!),
             ),
           );
         }
       },
       child: BlocBuilder<UserInfoBloc, UserInfoState>(
         bloc: newsBloc,
         builder: (context, state) {
           if (state is UserInfoInitial) {
             return Container();
           } else if (state is DataLoading) {
             return buildLoading();
           } else if (state is UserInfoLoaded ) {
             return buildTextInfo("${state.Model.firstName!} ${state.Model.lastName!}");
           }
           else {
             return Container();
           }
         },
       ),
     ),
   );
 }
}
