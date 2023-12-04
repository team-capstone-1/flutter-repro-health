import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';

import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RescheduleView extends StatefulWidget {
  const RescheduleView({
    super.key,
  });

  @override
  State<RescheduleView> createState() => _RescheduleViewState();
}

class _RescheduleViewState extends State<RescheduleView> {
  List<DateTime> getSundayHolidays(int year) {
    List<DateTime> sundays = [];

    for (int month = 1; month <= 12; month++) {
      for (int day = 1; day <= 31; day++) {
        setState(() {
          try {
            DateTime date = DateTime(year, month, day);

            if (date.weekday == DateTime.sunday) {
              //tambahkan semua hari minggu dalam satu tahun
              sundays.add(date);
            }
          } catch (e) {
            if (kDebugMode) {
              print('Invalid Date $e');
            }
          }
        });
      }
    }
    return sundays;
  }

  List<String> sessions = [
    "Pagi 08.00-11.00",
    "Siang 13.00-15.30",
    "Malam 19.00-20.30",
  ];

  DateTime selectedDate = DateTime.now();
  String selectedSession = '';

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as Transaction;

    final int currentYear = DateTime.now().year;
    final List<DateTime> sundayHolidays = getSundayHolidays(currentYear);

    int indexDoctor = 0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //^ APPBAR
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 280,
            backgroundColor: grey10,
            leading: Material(
              color: grey10,
              borderRadius: BorderRadius.circular(50),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                child: Image.network(
                  appointmentData.doctor?[indexDoctor].avatar ?? '-',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //^ BODY
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                //^ Nama & Spesialis Dokter
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentData.doctor?[indexDoctor].name ?? '-',
                        style: semiBold16Grey500,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        appointmentData.doctor?[indexDoctor].specialist ?? '-',
                        style: regular12Grey300,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                //^ Informasi Dokter
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Dokter",
                        style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.local_hospital_outlined,
                            color: Color(0xFF686868),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            appointmentData.clinic ?? '-',
                            style: regular12Grey300,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF686868),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            appointmentData.location ?? '-',
                            style: regular12Grey300,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.attach_money_outlined,
                            color: Color(0xFF686868),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            Provider.of<RiwayatViewModel>(context).convertToIdr(
                              appointmentData.totalBill,
                              2,
                            ),
                            style: medium12Green500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                //^ Pilih Jadwal & Tooltip
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Pilih Jadwal",
                        style: semiBold14Grey500,
                      ),
                      const SizedBox(width: 8),
                      JustTheTooltip(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Kamu hanya dapat mengganti jadwal sebanyak 1 kali setelah 1 minggu melakukan pemesanan janji temu',
                          ),
                        ),
                        child: const Icon(
                          Icons.info_outline,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                //^ Tanggal
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: DatePicker(
                    DateTime.now(),
                    locale: "in_ID",
                    initialSelectedDate: DateTime.now(),
                    deactivatedColor: grey300,
                    selectionColor: green500,
                    selectedTextColor: Colors.white,
                    inactiveDates: sundayHolidays,
                    dayTextStyle: semiBold12Grey300,
                    dateTextStyle: semiBold16Grey300,
                    monthTextStyle: semiBold12Grey300,
                    daysCount: 30,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),

                //^ Pilih Sesi
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Pilih Sesi",
                    style: semiBold14Grey500,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    var sessionsListData = sessions[index];

                    return sessionContainerItem(sessionsListData);
                  },
                ),

                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),

      //^ ACTION BUTTON
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: selectedSession.isNotEmpty
                ? () {
                    if (kDebugMode) {
                      print(selectedSession);
                      print(selectedDate);
                    }

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesNavigation.confirmStatusView,
                      (route) => route.isFirst,
                      arguments: 'Berhasil Mengubah Jadwal',
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF14C6A4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Text(
                "Ganti Jadwal",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector sessionContainerItem(String sessionsListData) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSession = sessionsListData;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color:
                      selectedSession == sessionsListData ? green500 : grey100,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sessionsListData.replaceAll(RegExp(r'[0813529.-]'), ''),
                        style: medium12Grey500,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${sessionsListData.replaceAll(RegExp(r'[a-zA-Z ]'), '')} WIB",
                        style: regular10Grey300,
                      ),
                    ],
                  ),
                  Radio(
                    activeColor: green500,
                    fillColor: MaterialStateProperty.all(
                      green500,
                    ),
                    value: sessionsListData,
                    groupValue: selectedSession,
                    onChanged: (value) {
                      setState(() {
                        selectedSession = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
