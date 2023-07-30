

import 'package:flutter/material.dart';

import '../../theme.dart';


class DefaultTextField extends StatefulWidget {

 const  DefaultTextField({Key? key,this.icon,this.label,this.number,this.maxLines,
     this.image,this.description=false,this.password=false,this.controller,this.validator,this.email = false}) : super(key: key);

  final String? label;
 final IconData? icon;
 final bool? number;
 final  bool? email;
 final String? image;
 final bool? description;
 final bool? password;
 final int ? maxLines;
 final  TextEditingController ?controller ;
   final String? Function(String?)? validator;


  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {

  bool focus2 = false;
  bool seePassword = false;
  TextEditingController controller2 =TextEditingController();

@override
  void initState() {
    // TODO: implement initState
  //widget.password=false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
   //   width: width*0.8,
//margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(15),
      //  border: Border.all(color: Colors.grey.shade200)

      ),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) => setState(() {focus2 = focus;}),
          child: TextFormField(
            controller: widget.controller ?? controller2,
            cursorColor: AppTheme.primary,
            keyboardType:widget.number!=null? TextInputType.number: widget.email == true? TextInputType.emailAddress :TextInputType.text,
            maxLines: widget.description==true && widget.password==false?4:1,
            obscureText: widget.password==true&&!seePassword,
          //  minLines: widget.maxLines ??1,
            decoration: InputDecoration(
                fillColor: AppTheme.background,
                filled: true,
              border:
              const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    width: 1, color: Colors.transparent),
              ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      width: 1, color: Colors.transparent),
                ),
              focusedBorder: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    width: 1, color: AppTheme.primary),
              ),


              hintText: widget.label,
              hintStyle: TextStyle(color:focus2?

                  AppTheme.primary:Colors.grey,

                  fontWeight: FontWeight.bold,fontSize: 18),
        //      prefixIcon:
              // widget.icon!=null? Icon(widget.icon,
              //     color:AppTheme.primary)
              //     :Padding(
              //       padding:  EdgeInsets.only(left:LocalStorage.getData(key: "lang") == "en"? 10.0:0,right:LocalStorage.getData(key: "lang") == "ar"? 10.0:0,),
              //        child: SizedBox(
              //          width: 90,
              //         child: Row(
              //           children: [
              //            Image.asset(widget.image! ,width: 25,
              //    ),
              //            SizedBox(width: 5,),
              //            Text("+996",style: TextStyle(color: AppTheme.primary),),
              //             SizedBox(height: 20,
              //                 child: VerticalDivider(color: AppTheme.primary,thickness: 1.4,)),
              //           ],
              //         ),
              //        )
              // ),
              suffixIcon: widget.password??false?InkWell(
                onTap: (){
                  setState(() {
                    seePassword=!seePassword;
                  });
                },
                child: Icon(
                  seePassword?
                  Icons.remove_red_eye:
                  Icons.visibility_off,
                  color: Colors.black38,
                ),
              ): const SizedBox (
                height: 0,
                width: 0,
              )
            ),

            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
