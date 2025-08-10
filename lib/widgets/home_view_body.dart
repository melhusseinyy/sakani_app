import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/views/create_acc_page.dart';
import 'package:sakni/widgets/container-header.dart';
import 'package:sakni/widgets/sign_in_body.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool isCreateAccountActive = true;

  void handleTabChange(bool value) {
    setState(() {
      isCreateAccountActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false ,
     
      body: Stack(
        children: [
          CustomTextHome(
            title: 'مرحبا بك في سكني',
            subTitle: 'هيا قم بتسجيل الدخول وابدأ رحلتك في البحث عن سكنك',
          ),
          Column(
            children:[
              Spacer(),
               Container(
              height: 580.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  ContainerHeader(
                    isCreateAccountActive: isCreateAccountActive,
                    onTabChange: handleTabChange,
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: isCreateAccountActive
                        ? CreateAccountBody() // جسم صفحة إنشاء حساب
                        : SigninBody(),         // جسم صفحة تسجيل دخول (الكود اللي انت عاملها)
                  ),
                ],
              ),
            ),
                   ] ),
        ],
      ),
    );
  }
}
