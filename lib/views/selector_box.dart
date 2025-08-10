
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';

class SelectorBox extends StatefulWidget {
  const SelectorBox({super.key, this.initialValue=0, this.onChanged});
  final int initialValue;
  final void Function(int)? onChanged;

  @override
  State<SelectorBox> createState() => _SelectorBoxState();
}

class _SelectorBoxState extends State<SelectorBox> {
  late int currentValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentValue=widget.initialValue;
  }
  void increase(){
    setState(() {
      currentValue++;
      widget.onChanged?.call(currentValue);
    });
    
  }
  void decrease(){
    setState(() {
      if(currentValue>0){
        currentValue--;
      widget.onChanged?.call(currentValue);
      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Row(
                               children: [
                                 Container(
                                  
                                 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Color(0xffE2E2E2)
                                  ),
                                  child: Row(
                                    
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(currentValue.toString(),style: TextStyle(
                                                             fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff090B0E)
                                                            )),
                                      ),
                                      SizedBox(width: 107.w,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 9.0,left: 12,bottom: 9),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: increase,
                                              child: Icon(Iconsax.arrow_up_2_copy,color: Color(0xff008080) ,size: 16,weight: 1.5,)),
                                            5.bh,
                                            GestureDetector(
                                              onTap: decrease,
                                              child: Icon(Iconsax.arrow_down_1_copy,color: Color(0xff008080) ,size: 16,weight: 1.5,))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                 ),
                                
                               ],
                             );
  }
}