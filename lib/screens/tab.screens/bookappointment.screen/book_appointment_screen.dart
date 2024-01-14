import 'package:alemeno_app/res/color.dart';
import 'package:alemeno_app/screens/tab.screens/bookappointment.screen/widgets/time_card.dart';
import 'package:alemeno_app/screens/tab.screens/hometab.screen/home_view_model.dart';
import 'package:alemeno_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        title: Text(
          "Book Appointment",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Date",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.appBarTitle),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurStyle: BlurStyle.inner)
                        ], color: AppColor.white, borderRadius: BorderRadius.circular(8)),
                        child: Consumer<HomeViewModel>(builder: (context, provider, child) {
                          return TableCalendar(
                            calendarStyle: const CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                    color: AppColor.buttonColor, shape: BoxShape.circle)),
                            headerStyle: const HeaderStyle(
                              leftChevronMargin: EdgeInsets.symmetric(horizontal: 0.0),
                              rightChevronMargin: EdgeInsets.symmetric(horizontal: 0.0),
                              leftChevronIcon: Icon(
                                Icons.chevron_left,
                                color: AppColor.badgeColor,
                              ),
                              rightChevronIcon: Icon(
                                Icons.chevron_right,
                                color: AppColor.badgeColor,
                              ),
                              titleCentered: true,
                            ),
                            firstDay: DateTime.now(),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: provider.focusedDay,
                            onDaySelected: (selectedDay, focusedDay) {
                              provider.setSelectedDate(selectedDay, focusedDay);
                            },
                            availableGestures: AvailableGestures.all,
                            selectedDayPredicate: (day) => isSameDay(day, provider.focusedDay),
                            availableCalendarFormats: const {
                              CalendarFormat.month: 'Month',
                            },
                          );
                        }),
                      ),
                      Text(
                        "Select Time",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.appBarTitle),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCard(time: "8:00 AM"),
                            TimeCard(time: "9:00 AM"),
                            TimeCard(time: "10:00 AM"),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCard(time: "11:00 AM"),
                            TimeCard(time: "12:00 AM"),
                            TimeCard(time: "1:00 AM"),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCard(time: "2:00 AM"),
                            TimeCard(time: "3:00 AM"),
                            TimeCard(time: "4:00 AM"),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 11.0, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCard(time: "5:00 AM"),
                            TimeCard(time: "6:00 AM"),
                            TimeCard(time: "7:00 AM"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Consumer<HomeViewModel>(builder: (context, provider, child) {
                return InkWell(
                  onTap: () {
                    provider.selectedDate.isNotEmpty && provider.selectedTime.isNotEmpty
                        ? Navigator.pop(context)
                        : Utils.snackbar("Select Date and time", context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: provider.selectedDate.isNotEmpty && provider.selectedTime.isNotEmpty
                          ? AppColor.buttonColor
                          : const Color(0xffB0B0B0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Confirm",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 14, color: AppColor.white),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
