import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_apps/View/widgets/edit_profile/edit_profile_widget.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:provider/provider.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  void initState() {
    final editProfileViewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);
    final userInfo = Provider.of<EditProfileViewModel>(context, listen: false);
    editProfileViewModel.getNewChangeUserInfo();
    userInfo.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = Provider.of<EditProfileViewModel>(context);
    final userInfo = Provider.of<EditProfileViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          textFormFieldWidget(
            title: 'Fullname',
            errorText: editProfileViewModel.isFullnameValid
                ? null
                : editProfileViewModel.errorFullnameMessage,
            onChanged: (value) {
              editProfileViewModel.validateFullname(value);
            },
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
            ],
            controller: editProfileViewModel.nameController,
            hintText: '${userInfo.name}',
          ),
          textFormFieldWidget(
            title: 'Email',
            readOnly: true,
            hintText: '${userInfo.email}',
            prefixIcon: Image.asset('assets/icon/ic_search.png'),
          ),
          textFormFieldWidget(
            title: 'Number Phone',
            errorText: editProfileViewModel.isPhoneNumberValid
                ? null
                : editProfileViewModel.errorPhoneNumberMessage,
            onChanged: (value) {
              editProfileViewModel.validatePhoneNumber(value);
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: SizedBox(
              height: 10,
              width: 10,
              child: Center(
                child: Text(
                  '+62 ',
                  style: blackTextStyle.copyWith(),
                ),
              ),
            ),
            controller: editProfileViewModel.phoneController,
            hintText: '${editProfileViewModel.phone}',
          ),
          textFormFieldWidget(
            title: 'Confirm Password',
            errorText: editProfileViewModel.isConfirmPasswordValid
                ? null
                : editProfileViewModel.errorConfirmPasswordMessage,
            onChanged: (value) {
              editProfileViewModel.validateConfirmPassword(value);
            },
            controller: editProfileViewModel.confirmPasswordController,
            obscureText: editProfileViewModel.isHidePassword,
            hintText: '**************',
            suffixIcon: IconButton(
              onPressed: () {
                editProfileViewModel.showHidePassword();
              },
              icon: Image.asset(
                editProfileViewModel.isHidePassword
                    ? 'assets/icon/ic_hide.png'
                    : 'assets/icon/ic_show.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          InkWell(
            onTap: () {
              editProfileViewModel.cekPerkondisian(context);
            },
            child: Container(
              width: double.infinity,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: editProfileViewModel.disableButtonSave()
                    ? Colors.grey
                    : Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Save Changes',
                  style: whiteTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
