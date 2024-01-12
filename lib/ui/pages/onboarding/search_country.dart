import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/empty_widget.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/country_cities.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  _SearchCountryState createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List<Country> countries = [];
  List<Country> filtered = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/countries.json');
    final List data = await json.decode(response);
    for (var e in data) {
      countries.add(Country.fromJson(e));
    }
    setState(() {});
    filtered.addAll(countries);
  }

  bool removeImage = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Search Country',
      removeImage: removeImage,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: CustomTextField(
              hintText: 'Search for your country',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.search,
              autoFocus: true,
              onChanged: (a) {
                a = a!.trim();
                if (a.isNotEmpty) {
                  a = a.toUpperCase();
                  filtered.clear();
                  for (Country item in countries) {
                    if (item.country.toUpperCase().contains(a) ||
                        item.code.toUpperCase().contains(a)) {
                      filtered.add(item);
                    }
                  }
                } else {
                  filtered.clear();
                  filtered.addAll(countries);
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
              ? const Expanded(child: AppEmptyWidget('Country not found', ''))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      itemCount: filtered.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Country data = filtered[index];
                        return InkWell(
                          onTap: () => Navigator.pop(context, data),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: regularText(
                                      data.country,
                                      fontSize: 16.sp,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  SizedBox(width: 10.h),
                                  regularText(
                                    data.code,
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
