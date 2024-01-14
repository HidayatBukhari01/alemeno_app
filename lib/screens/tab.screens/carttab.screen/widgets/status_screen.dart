import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    final useViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return PopScope(
      onPopInvoked: (didPop) {
        useViewModel.scheduleTest(context);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.white,
            scrolledUnderElevation: 0.0,
            elevation: 0.0,
            title: Text(
              "Success",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.appBarTitle),
            ),
            actions: const [
              Icon(
                Icons.more_vert,
                color: AppColor.moreVertIcon,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 23),
                          padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 18),
                          width: dimension["width"],
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColor.labCardBorder)),
                          child: Column(
                            children: [
                              Image.asset("assets/images/success.png"),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  "Lab tests have been scheduled successfully, You will receive a mail of the same.",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: AppColor.cartCardTitle),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text(
                                  "11 Oct 2023  |  9 AM",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColor.statusTime),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      useViewModel.scheduleTest(context);
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Back to home",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
