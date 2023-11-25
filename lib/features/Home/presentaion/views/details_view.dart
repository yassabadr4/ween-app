import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ween/core/componants/buttons/circle_button.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/features/Home/presentaion/views/widgets/custom_contact.dart';
import 'package:ween/features/Home/presentaion/views/widgets/custom_small_image.dart';
import 'package:ween/features/Home/presentaion/views/widgets/new_offers_list_view.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final images = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/K-SupermarketTarmola.jpg/220px-K-SupermarketTarmola.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG3T_ZLXCAofpcASsaQjghkPFRsrcuO23EwvV6crT2NGq4R9j_bB53FWOInWup20Gys-s&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtAzPrEAbEsfyrkG-i66aZMeeI2axwL923cA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxll6Jrlkdb9B1u41mr1rpbX2gFIVSb4TmJg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxll6Jrlkdb9B1u41mr1rpbX2gFIVSb4TmJg&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleButton(
                      icon: Icons.arrow_back,
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'معلومات المحل        ',
                      style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const Spacer()
                  ],
                ),
                const Row(
                  children: [
                    CustomSmallImage(),
                    Text(
                      'سوبرماركت',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                AspectRatio(
                  aspectRatio: 4 / 4,
                  child: NewOfferListView(images: images),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'العروض والخصومات',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'محل البقالة هو نوع من المحلات التجارية الصغيرة التي توفر مجموعة متنوعة من المنتجات الغذائية وغير الغذائية الأساسية للاستخدام اليومي. يعتبر محل البقالة وجهة مهمة للمستهلكين لشراء السلع الضرورية بشكل يومي.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomContact(
                  icon: Ionicons.logo_whatsapp,
                  title: '01223456789',
                  ontap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomContact(
                  icon: Icons.email_outlined,
                  title: 'mohamed@gmail.com',
                  ontap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomContact(
                  icon: Ionicons.logo_facebook,
                  title: 'https://facebook.com',
                  ontap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomContact(
                  icon: Icons.location_on_outlined,
                  title: 'Cairo,Egypt',
                  ontap: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomContact(
                  icon: Icons.language_outlined,
                  title: 'https://market/maps.com',
                  ontap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
