import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/routes/routes_name.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/widgets/lab_test_card.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import 'widgets/popular_package_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Logo",
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, color: AppColor.appBarTitle),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, RouteName.cartScreenRoute),
              child: Consumer<HomeViewModel>(
                builder: (context, provider, child) {
                  return badges.Badge(
                    showBadge: provider.cartItemsList.isNotEmpty ? true : false,
                    position: badges.BadgePosition.topStart(top: 0, start: -20),
                    badgeContent: Text(
                      provider.cartItemsList.length.toString(),
                      style: GoogleFonts.inter(fontSize: 8, fontWeight: FontWeight.w500),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: AppColor.badgeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: AppColor.buttonColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular lab tests",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.buttonColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "View more",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: AppColor.buttonColor,
                            decoration: TextDecoration.underline),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColor.buttonColor,
                        size: 14,
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                    height: dimension['height']! * 0.71,
                    child: Consumer<HomeViewModel>(
                      builder: (context, provider, child) {
                        return GridView.count(
                          childAspectRatio: dimension["height"]! * 0.45 / dimension["width"]!,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          children: List.generate(
                            provider.labTestsLists.length,
                            (index) {
                              return LabTestCard(labTest: provider.labTestsLists[index]);
                            },
                          ),
                        );
                      },
                    )),
              ),
              Text(
                "Popular Packages",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.buttonColor),
              ),
              const Center(
                child: PopularPackageCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
