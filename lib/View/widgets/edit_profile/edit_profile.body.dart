import 'package:flutter/material.dart';
import 'package:lms_apps/Services/edit_profile_service.dart';
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
    editProfileViewModel.getNewChangeUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    // final editProfileViewModel = Provider.of<EditProfileViewModel>(context);
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 30),
    //   child: Column(
    //     children: [
    //       textFormFieldWidget(
    //         title: 'Fullname',
    //         controller: editProfileViewModel.nameController,
    //         hintText: '${editProfileViewModel.name}',
    //       ),
    //       textFormFieldWidget(
    //         title: 'Email',
    //         readOnly: true,
    //         hintText: '${editProfileViewModel.email}',
    //         prefixIcon: Image.asset('assets/icon/ic_search.png'),
    //       ),
    //       textFormFieldWidget(
    //         title: 'Number Phone',
    //         controller: editProfileViewModel.phoneController,
    //         hintText: '${editProfileViewModel.phone}',
    //       ),
    //       textFormFieldWidget(
    //         title: 'Confirm Password',
    //         controller: editProfileViewModel.confirmPassword,
    //         hintText: '**************',
    //         suffixIcon: IconButton(
    //           onPressed: () {},
    //           icon: Image.asset(
    //             'assets/icon/ic_hide.png',
    //             width: 20,
    //             height: 20,
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: MediaQuery.of(context).size.height * 0.15),
    //       InkWell(
    //         onTap: () {
    //           EditProfileViewModel().getNewChangeUserInfo();
    //           // EditProfileService().changeUserInfo(
    //           //   name: nameController.text,
    //           //   phone: phoneController.text,
    //           //   password: confirmPassword.text,
    //           // );
    //         },
    //         child: Container(
    //           width: double.infinity,
    //           height: 34,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8), color: Colors.blue),
    //           child: Center(
    //               child: Text(
    //             'Save Changes',
    //             style: whiteTextStyle,
    //           )),
    //         ),
    //       ),
    //       SizedBox(height: MediaQuery.of(context).size.height * 0.05),
    //     ],
    //   ),
    // );
    return FutureBuilder(
      future: EditProfileService().getUserInfo(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              textFormFieldWidget(
                title: 'Fullname',
                controller: nameController,
                hintText: snapshot.data?.data?.name ?? "",
              ),
              textFormFieldWidget(
                title: 'Email',
                readOnly: true,
                hintText: '${snapshot.data?.data?.email}',
                prefixIcon: Image.asset('assets/icon/ic_search.png'),
              ),
              textFormFieldWidget(
                title: 'Number Phone',
                controller: phoneController,
                hintText: '${snapshot.data?.data?.phone}',
              ),
              textFormFieldWidget(
                title: 'Confirm Password',
                controller: confirmPassword,
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
                onTap: () {
                  // EditProfileViewModel().getNewChangeUserInfo();
                  EditProfileService().changeUserInfo(
                    name: nameController.text,
                    phone: phoneController.text,
                    password: confirmPassword.text,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
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
      },
    );
  }

  Widget textFormFieldWidget({
    required String title,
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool readOnly = false,
    TextEditingController? controller,
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
          readOnly: readOnly,
          controller: controller,
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
