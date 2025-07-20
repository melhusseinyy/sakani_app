import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/payment_container.dart';

class ChargeWalletPage extends StatefulWidget {
  const ChargeWalletPage({super.key});

  @override
  State<ChargeWalletPage> createState() => _ChargeWalletPageState();
}

class _ChargeWalletPageState extends State<ChargeWalletPage> {
  int selectedIndex= -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff005C5C),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Color(0xff005C5C),
            title:Text('شحن المحفظه',style: TextStyle(
              fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.white
            ),) ,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          8.bh,
          Text('اختر الطريقه التى تريد شحن محفظتك بها',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w400,color: Colors.white
            ),),
            24.bh,
            Expanded(
              child: Container(
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.elliptical(200, 20),
                topRight: Radius.elliptical(200, 20)
                ),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      38.bh,
                      PaymentContainer(image: 'assets/images/unnamed.png',
                      isSelected:selectedIndex==0 ,
                      onTap: () {
                        setState(() {
                          selectedIndex=0;
                        });
                      },),
                      24.bh,
                     PaymentContainer(image: 'assets/images/PayPal.svg.png',
                      isSelected: selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },),
                     24.bh,
                     PaymentContainer(image: 'assets/images/Coverage-Page-400x200-27.png',
                      isSelected: selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },)
                  
                    ],
                  ),
                ),
              ),
              
              ),
            )


        ],
      ),
      
    );
  }
}