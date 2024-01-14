import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({super.key, required this.time});
  final String time;
  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Consumer<HomeViewModel>(builder: (context, provider, child) {
      return InkWell(
        onTap: () => provider.setSelectedTime(time),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          width: dimension["width"]! * 0.25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: provider.selectedTime == time ? AppColor.buttonColor : null,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColor.buttonColor, width: 2)),
          child: Text(
            time,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: provider.selectedTime == time ? AppColor.white : AppColor.appBarTitle),
          ),
        ),
      );
    });
  }
}
