import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/routes/routes_name.dart';
import 'package:alemeno_app/screens/tab.screens/carttab.screen/widgets/cart_item_card.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'widgets/cart_total_card.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return PopScope(
      onPopInvoked: (didPop) => useViewModel.clearDateTime(),
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          title: Text(
            "My Cart",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<HomeViewModel>(builder: (context, provider, child) {
            return provider.cartItemsList.isEmpty
                ? const Center(
                    child: Text("Cart is empty!"),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Review",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColor.buttonColor),
                              ),
                              ...provider.cartItemsList.map((labTest) {
                                return CartItemCard(labTest: labTest);
                              }).toList(),
                              InkWell(
                                onTap: () =>
                                    Navigator.pushNamed(context, RouteName.bookAppointmentRoute),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                                  margin: const EdgeInsets.symmetric(vertical: 17),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColor.labCardBorder)),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/calendar.png"),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 16),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: AppColor.labCardBorder)),
                                          child: Text(
                                            provider.selectedDate.isEmpty ||
                                                    provider.selectedTime.isEmpty
                                                ? "Select Date"
                                                : "${provider.selectedDate} ${provider.selectedTime}",
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: provider.selectedDate.isEmpty ||
                                                        provider.selectedTime.isEmpty
                                                    ? null
                                                    : AppColor.buttonColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              CartTotalCard(
                                provider: provider,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 17),
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColor.labCardBorder)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      activeColor: AppColor.buttonColor,
                                      checkColor: AppColor.white,
                                      value: provider.hardCopy,
                                      shape: const CircleBorder(),
                                      onChanged: (bool? value) {
                                        provider.setHardCopy(value);
                                      },
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 12.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hard Copy of Reports",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.wantReportTitle,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.\n\n₹150 per person",
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: AppColor.wantReportDescription),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            provider.selectedDate.isEmpty || provider.selectedTime.isEmpty
                                ? Utils.snackbar("Please select date first", context)
                                : Navigator.pushNamed(context, RouteName.statusRoute);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 4),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: provider.selectedDate.isEmpty || provider.selectedTime.isEmpty
                                  ? const Color(0xffB0B0B0)
                                  : AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Schedule",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
