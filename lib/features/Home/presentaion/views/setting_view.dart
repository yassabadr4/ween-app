import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_text_from_field.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool showPassword = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تعديل الملف',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextFromField(
                    labelText: 'رقم الهاتف',
                    prefixIcon: Icon(
                      color: kPrimary,
                      Ionicons.logo_whatsapp,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextFromField(
                    labelText: 'الايميل',
                    prefixIcon: Icon(
                      color: kPrimary,
                      Icons.email,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextFromField(
                    labelText: 'العنوان',
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextFromField1(
                    keyboardType: TextInputType.url,
                    labelText: 'الفيسبوك',
                    prefixIcon: Icon(
                      Icons.facebook_outlined,
                      color: kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextFromField1(
                    labelText: 'الموقع الجغرافي',
                    prefixIcon: Icon(
                      Icons.add_location_alt_outlined,
                      color: kPrimary,
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: MaterialButton(
                        onPressed: () {},
                        color: kPrimary,
                        height: 50,
                        child: const Text('حفظ'),
                      ),
                    ),
                    const SizedBox(width: 100,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: MaterialButton(
                        onPressed: () {},
                        color: kPrimary,
                        height: 50,
                        child: const Text('الغاء'),
                      ),
                    ),
                  ],
                )
                ],
              ),
            ),
          ),
        ));
  }
}

// Widget buildTextField(
//     String labelText, String placeholder, bool isPasswordTextField) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 35.0),
//     child: TextFormField(
//       obscureText: isPasswordTextField ? showPassword : false,
//       decoration: InputDecoration(
//           suffixIcon: isPasswordTextField
//               ? IconButton(
//             onPressed: () {
//               setState(() {
//                 showPassword = !showPassword;
//               });
//             },
//             icon: showPassword ? const Icon(
//               Icons.remove_red_eye,
//               color: kPrimary,
//             ) : const Icon(Icons.visibility_off,
//               color: kPrimary,
//             ),
//           )
//               : null,
//           contentPadding: const EdgeInsets.only(bottom: 3),
//           labelText: labelText,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           hintText: placeholder,
//           hintStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           )),
//     ),
//   );
// }
//Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.green,
//           ),
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               const Text(
//                 "تعديل الملف",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//
//               const SizedBox(
//                 height: 35,
//               ),
//               buildTextField("الاسم", "Dor Alex", false),
//               buildTextField("الايميل", "alexd@gmail.com", false),
//               buildTextField("الرقم السري", "********", true),
//               buildTextField("العنوان", "TLV, test", false),
//               const SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3,
//                     child: MaterialButton(
//                       onPressed: () {},
//                       color: kPrimary,
//                       height: 50,
//                       child: const Text('حفظ'),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3,
//                     child: MaterialButton(
//                       onPressed: () {},
//                       color: kPrimary,
//                       height: 50,
//                       child: const Text('الغاء'),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
