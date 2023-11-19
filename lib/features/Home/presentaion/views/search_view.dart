import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back,color: kPrimary,)),
        title: const Text(
          'البحث',
          style: TextStyle(
            color: kPrimary,
          ),

        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            cursorColor: kPrimary,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: kPrimary),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              suffixIcon: const Icon(Icons.search,color: kPrimary,),
            ),
          ),
        ),
      ),
    );
  }
}

