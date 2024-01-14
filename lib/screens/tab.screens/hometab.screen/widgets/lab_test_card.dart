import 'package:alemeno_app/model/lab_test_model.dart';
import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LabTestCard extends StatelessWidget {
  const LabTestCard({super.key, required this.labTest});
  final LabTestModel labTest;
  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      height: dimension["height"]! * 0.45,
      width: (dimension['width']! * 0.45),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColor.labCardBorder)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: AppColor.labCardHeaderBg,
            ),
            child: Text(
              labTest.name,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700, fontSize: 12, color: AppColor.white),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labTest.description,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: AppColor.labCardCount,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.badgeColor,
                        ),
                        child: const Icon(
                          Icons.gpp_good,
                          color: AppColor.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        "Gets reports in ${labTest.reportTime} hours",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: AppColor.packageDescription,
                            fontSize: 11),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Text(
                            "\u{20B9} ${labTest.price}",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                color: AppColor.buttonColor,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            labTest.oldPrice.toString(),
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                color: AppColor.labCardDescription,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<HomeViewModel>(builder: (context, provider, child) {
                      return InkWell(
                        onTap: () => provider.addTestToCart(labTest),
                        child: Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 4, left: 14, right: 14),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: provider.cartItemsList.contains(labTest)
                                ? AppColor.badgeColor
                                : AppColor.buttonColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            provider.cartItemsList.contains(labTest)
                                ? "Added to cart"
                                : "Add to cart",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700, fontSize: 12, color: AppColor.white),
                          ),
                        ),
                      );
                    }),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.buttonColor)),
                      child: Text(
                        "View Details",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 12, color: AppColor.buttonColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
