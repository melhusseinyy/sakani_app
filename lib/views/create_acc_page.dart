import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/views/code_vertification_page.dart';
import 'package:sakni/widgets/container-header.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class CreateAccPage extends StatefulWidget {
  const CreateAccPage({super.key});

  @override
  State<CreateAccPage> createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTextHome(title: 'مرحبا بك فى سكني', subTitle: 'هيا قم بتسجيل الدخول و ابدأ رحلتك للبحث عن سكنك'),
          
           Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child:Container(
                height: 580.h
                ,
                  decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r)),
          color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).w,
                    child: Column(
                      children: [
                        SizedBox(height: 24.h,),
                        ContainerHeader(isCreateAccountActive: true,),
                        SizedBox(height: 24.h,),
                         CustomFormTextField(hintText:'رقم الهاتف' ,prefixIcon:Icon(Iconsax.call),suffixIcon:CountryCodePicker() ,onChanged: (value){
                         setState(() {
                         phoneNumber=value;
                           
                         });
                        },),
                         SizedBox(height: 279.h,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context){
                              return CodeVertificationPage();
                              
                            }));
                          },
                          child: Container(
                            height: 54.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Color(0xff008080),
                            ),
                            child: Center(
                              child: Text('المتابعة',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                          ),
                        ),
                         SizedBox(height: 24.h,),
                        Text('هل تريد لمتابعة كزائر؟',style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff008080)
                        ),)
                      ],
                    ),
                  ),
      ),),],
      ),
      
    );
  }
}