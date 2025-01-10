import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/AppFonts.dart';

import '../Utils/style.dart';


class CustomInput extends StatefulWidget {
  final String lable;
  final String validator;
  final TextEditingController Controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  final List<TextInputFormatter>formats;
  final FocusNode focusNode1;
  FocusNode? focusNode2 ;
  CustomInput({Key? key, FocusNode? this.focusNode2,required this.lable, required this.validator, required this.Controller, required this.keyboardType, required this.obscureText, required this.icon, required this.formats, required this.focusNode1}) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isPassword=false;
  bool isOpen=false;
  @override
  Widget build(BuildContext context) {
    isPassword=widget.obscureText;
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.lable,style:AppFonts.fontRegularSmall,),
        const SizedBox(height: 2,),
        TextFormField(
          focusNode: widget.focusNode1,
          onFieldSubmitted: (_) {
            if(widget.focusNode2!=null)
              {
            FocusScope.of(context).requestFocus(widget.focusNode2);
              }
          },
          controller: widget.Controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.formats,
          // textDirection: TextDirection.ltr,
          obscureText: isOpen,
          decoration: InputDecoration(
            labelText: "",
            prefixIcon: Icon(
              widget.icon,
              color: blackColor50,
            ),
            suffixIcon:(isPassword && widget.obscureText)
                ? InkWell(
              onTap: onPressSufixobscureTextIcon,
              child: Icon(
                isOpen ? Icons.visibility_off : Icons.visibility,
                color: blackColor50,
              ),
            )
                : IconButton(onPressed: (){}, icon: Icon(Icons.text_increase,color: Colors.transparent,)),
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRaduis),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRaduis),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRaduis),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRaduis),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRaduis),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
          validator: (value) => value!.isEmpty && widget.validator!='' ? widget.validator : null,
        ),
      ],
    );
  }

  onPressSufixobscureTextIcon()
  {
    isOpen=!isOpen;
    setState(() {

    });
  }
}
