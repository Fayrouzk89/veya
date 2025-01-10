import 'package:flutter/material.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import 'package:veya_club/Utils/AppFonts.dart';

import '../../Utils/sizes_consts.dart';
import '../../Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Main content of the screen

            // Rounded container at the bottom
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: msgColor,
                        borderRadius:
                            BorderRadius.circular(SizesConstant.roundedCorner),
                      ),
                      child: Row(
                        children: [
                          // TextField
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "ask_or_say".tr(),
                                hintStyle: TextStyle(color: btnColor),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                // Hides the border when enabled
                                focusedBorder: InputBorder
                                    .none, // Hides the border when focused
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          // Rounded Button
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "Send".tr(),
                              style: AppFonts.fontBoldMeduim
                                  .copyWith(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
