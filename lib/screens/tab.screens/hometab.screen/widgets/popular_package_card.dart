import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularPackageCard extends StatelessWidget {
  const PopularPackageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.only(top: 24, left: 24, bottom: 24, right: 18),
      width: dimension['width']! * 0.8,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.borderPackage),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: dimension["width"]! * 0.08,
                backgroundColor: AppColor.packageImageContainer,
                child: Image.asset("assets/images/badge.png"),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                height: (dimension['height']! * 0.4) * 0.10,
                width: (dimension['width']! * 0.8) * 0.23,
                decoration: BoxDecoration(
                    color: const Color(0xff16C2D5), borderRadius: BorderRadius.circular(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.gpp_good,
                      color: AppColor.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Safe",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400, color: AppColor.white, fontSize: 13),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              "Full Body checkup",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Text(
            "Includes 92 tests",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400, fontSize: 12, color: AppColor.packageDescription),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• Blood Glucose Fasting",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColor.packageDescription),
                ),
                Text(
                  "• Liver Function Test",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColor.packageDescription),
                ),
              ],
            ),
          ),
          Text(
            "View more",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: AppColor.packageDescription,
                decoration: TextDecoration.underline),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\u{20B9} ${2000}/-",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, color: AppColor.badgeColor, fontSize: 20),
              ),
              Container(
                alignment: Alignment.center,
                height: (dimension['height']! * 0.4) * 0.16,
                width: (dimension['width']! * 0.8) * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: AppColor.buttonColor)),
                child: Text(
                  "Add to cart",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 15, color: AppColor.buttonColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
