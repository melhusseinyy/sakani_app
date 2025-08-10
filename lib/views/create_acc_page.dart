import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/views/code_vertification_page.dart';
import 'package:sakni/widgets/custom_text_field.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? phoneNumber;
  String countryCode = '+20';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CustomFormTextField(
                  hintText: 'رقم الهاتف',
                  prefixIcon: Icon(Iconsax.call),
                  suffixIcon: CountryCodePicker(
                    initialSelection: 'مصر',
                    favorite: ['+20', 'مصر'],
                    onChanged: (country) {
                      setState(() {
                        countryCode = country.dialCode ?? '+20';
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل رقم الهاتف';
                    } else if (!RegExp(r'^[0-9]{9,15}$').hasMatch(value)) {
                      return 'رقم الهاتف غير صحيح';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  String fullPhoneNumber = '$countryCode$phoneNumber';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CodeVertificationPage();
                      },
                    ),
                  );
                }
              },
              child: Container(
                height: 54.h,
                width: 343.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Color(0xff008080),
                ),
                child: Center(
                  child: Text(
                    'المتابعة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            Center(
              child: Text(
                'هل تريد لمتابعة كزائر؟',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff008080),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
