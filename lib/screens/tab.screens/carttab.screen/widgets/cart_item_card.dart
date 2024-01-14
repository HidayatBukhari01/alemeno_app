import 'package:alemeno_app/model/lab_test_model.dart';
import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.labTest});
  final LabTestModel labTest;
  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Container(
      margin: const EdgeInsets.only(top: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.labCardBorder)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: AppColor.labCardHeaderBg,
            ),
            child: Text(
              "Pathology tests",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      labTest.name,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 15, color: AppColor.cartCardTitle),
                    ),
                    Column(
                      children: [
                        Text(
                          "\u{20B9} ${labTest.price}",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              color: AppColor.badgeColor,
                              fontSize: 16),
                        ),
                        Text(
                          labTest.oldPrice.toString(),
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              color: AppColor.labCardDescription,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Consumer<HomeViewModel>(builder: (context, provider, child) {
                  return InkWell(
                    onTap: () => provider.removeTestFromCart(labTest),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      width: dimension["width"]! * 0.32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColor.buttonColor)),
                      child: Row(
                        children: [
                          Image.asset("assets/images/trash.png"),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Remove",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColor.buttonColor),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                  width: dimension["width"]! * 0.62,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColor.buttonColor)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/upload.png"),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Upload prescription (optional)",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 12, color: AppColor.buttonColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
