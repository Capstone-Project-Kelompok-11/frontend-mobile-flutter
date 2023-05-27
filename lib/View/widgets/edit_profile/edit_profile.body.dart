import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          textFormFieldWidget(
            title: 'Fullname',
            hintText: 'Capstone Kelompok 11',
          ),
          textFormFieldWidget(
            title: 'Email',
            hintText: 'Capstone11@gmail.com',
            prefixIcon: Image.asset('assets/icon/ic_search.png'),
          ),
          textFormFieldWidget(
            title: 'Number Phone',
            hintText: '+628123456789',
          ),
          textFormFieldWidget(
            title: 'Fullname',
            hintText: '**************',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icon/ic_hide.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.blue),
              child: Center(
                  child: Text(
                'Save Changes',
                style: whiteTextStyle,
              )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }

  Widget textFormFieldWidget({
    required String title,
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.only(left: 16),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
