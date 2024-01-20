import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/empty_widget.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/country_cities.dart';
import 'package:medicon/ui/utils/specialties.dart';

class SearchSpecialty extends StatefulWidget {
  const SearchSpecialty({super.key});

  @override
  _SearchSpecialtyState createState() => _SearchSpecialtyState();
}

class _SearchSpecialtyState extends State<SearchSpecialty> {

  List<Specialty> specialties = [
    Specialty(specialty: "Anaesthesiology"),
    Specialty(specialty: "Audiologist"),
    Specialty(specialty: "CardiacSurgery"),
    Specialty(specialty: "Cardiology"),
    Specialty(specialty: "Clinical Microbiology"),
  ];
  List<Specialty> filtered = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  void readJson() {
    /* final String response =
        await rootBundle.loadString('assets/specialties.json');
    final List data = await json.decode(response); */
    /* for (var e in data) {
      specialties.add(Specialty.fromJson(e));
    } */
    setState(() {});
    filtered.addAll(specialties);
  }

  bool removeImage = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Search Specialty',
      removeImage: removeImage,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: CustomTextField(
              hintText: 'Search for your specialty',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.search,
              autoFocus: true,
              onChanged: (a) {
                a = a!.trim();
                if (a.isNotEmpty) {
                  a = a.toUpperCase();
                  filtered.clear();
                  for (Specialty item in specialties) {
                    if (item.specialty.toUpperCase().contains(a)) {
                      filtered.add(item);
                    }
                  }
                } else {
                  filtered.clear();
                  filtered.addAll(specialties);
                }
                setState(() {});
              },
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search.png', height: 16.h)
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          filtered.isEmpty
              ? const Expanded(child: AppEmptyWidget('Specialty not found', ''))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      itemCount: filtered.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Specialty data = filtered[index];
                        return InkWell(
                          onTap: () => Navigator.pop(context, data),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: regularText(
                                      data.specialty,
                                      fontSize: 16.sp,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(width: 10.h),
                                  regularText(
                                    "",
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                  ),
                                ],
                              )),
                        );
                      }),
                )
        ],
      ),
    );
  }
}