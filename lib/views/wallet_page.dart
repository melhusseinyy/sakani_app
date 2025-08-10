import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/random_text_field.dart';
import 'package:sakni/views/charge_wallet_page.dart';
import 'package:sakni/widgets/wallet_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key,  this.selectedIndex=0});
final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff005C5C),
      body:Column(
        children: [
          120.bh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ChargeWalletPage();
                    }));
                  },
                  child: Image.asset('assets/images/Group 1597881862.png')),
                 Image.asset('assets/images/Group 1597881863.png'),
              ],
            ),
          ),
          28.bh,
          Expanded(child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.elliptical(200, 20),
              topRight: Radius.elliptical(200, 20)
              ),
              color: Colors.white
             
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
              child: Column(
                children: [
                  34.bh,
                  RandomTextField(text: 'ابحث في عمليات الدفع و الشحن',width: 343.w,height: 40.h,),
                  16.bh,
                  Row(
                    children: [
                      Text('جميع المعاملات'),
                      Spacer(),
                      Text('عرض الكل'),
                      Icon(Iconsax.arrow_left_copy)
                    ], 
                  ),
                  20.bh,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(bottom:20).h,
                        child: WalletCard(isSelected: 5,),
                      );
                    }),
                  )
                 
                ],
              ),
            ),
          ))
          
          
        ],
      ),
    );
  }
}