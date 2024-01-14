import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTotalCard extends StatelessWidget {
  const CartTotalCard({
    super.key,
    required this.provider,
  });
  final HomeViewModel provider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.labCardBorder)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "M.R.P Total",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, fontSize: 11, color: AppColor.labCardCount),
              ),
              Text(
                provider.mrpTotal.toString(),
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, fontSize: 11, color: AppColor.labCardCount),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 11, color: AppColor.labCardCount),
                ),
                Text(
                  provider.discount.toString(),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 11, color: AppColor.labCardCount),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount to be paid",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 15, color: AppColor.buttonColor),
                ),
                Text(
                  "\u{20B9} ${provider.cartTotal}/-",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 15, color: AppColor.buttonColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Text(
                  "Total Savings",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: 11, color: AppColor.labCardCount),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "\u{20B9} ${provider.discount}/-",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 15, color: AppColor.buttonColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
