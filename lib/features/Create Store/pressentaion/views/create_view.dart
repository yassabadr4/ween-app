import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/componants/buttons/custom_botton.dart';
import '../../../../core/componants/colors.dart';
import '../../../Auth/presentation/views/widgets/custom_text_from_field.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url,);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )
    ) {
      throw 'can not launch url';
    }
  }
  File? imageFile;
  Widget? checkImage() {
    if (imageFile == null) {
      return const Icon(Icons.add_a_photo_outlined);
    } else {
      return Image.file(fit: BoxFit.cover, File(imageFile!.path));
    }
  }

  List categories = [
    'محل بقالة',
    'مكتبة',
    'صيدلية',
    'محل ملابس',
    'مطعم',
    'كافيه'
  ];
  String? selectedCategory;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'أضافة محل',
                    style: TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        getImage(source: ImageSource.gallery);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: checkImage()),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton<String>(
                        hint: const Text('أختر نوع المحل'),
                        style: const TextStyle(
                            color: kPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        borderRadius: BorderRadius.circular(12),
                        value: selectedCategory, // Set the initial value
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue;
                          });
                        },
                        items: categories
                            .map<DropdownMenuItem<String>>((dynamic value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const CustomTextFromField(
                  keyboardType: TextInputType.phone,
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(
                    Ionicons.logo_whatsapp,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField1(
                  labelText: 'الايميل',
                  prefixIcon: Icon(
                    Icons.email,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField1(
                  keyboardType: TextInputType.url,
                  labelText: 'الفيسبوك',
                  prefixIcon: Icon(
                    Icons.facebook_outlined,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField(
                  labelText: 'العنوان',
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField1(
                  labelText: 'الموقع الجغرافي',
                  prefixIcon: Icon(
                    Icons.add_location_alt_outlined,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField(
                  labelText: 'الموقع الالكتروني',
                  prefixIcon: Icon(
                    Icons.language,
                    color: kPrimary,
                  ),
                ),
                const CustomTextFromField(
                  labelText: 'كود الاشتراك',
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: kPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrl('https://wa.me/201064669094');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'ليس لدي كود اشتراك',
                      style: TextStyle(
                          color: kPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                CustomButton(
                    title: 'أضافة',
                    onPressd: () {
                      if (formKey.currentState!.validate()) {
                      } else {}
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
