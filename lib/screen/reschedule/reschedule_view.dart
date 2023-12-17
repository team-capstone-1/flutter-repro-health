import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/reschedule/widget/tooltip_widget.dart';
import 'package:reprohealth_app/screen/reschedule/widget/doctor_info_widget.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/screen/reschedule/rescedhule_view_model/rescedhule_view_model.dart';

class RescheduleView extends StatelessWidget {
  const RescheduleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // arguments
    var appointmentData =
        ModalRoute.of(context)!.settings.arguments as ResponseData?;

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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      appointmentData?.consultation?.doctor?.profileImage ??
                          '-',
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: grey400,
                  ),
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      Assets.assetsNoProfile,
                      fit: BoxFit.cover,
                    );
                  },
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

                // //^ Nama & Informasi Dokter
                DoctorInfoWidget(appointmentData: appointmentData),
                const SizedBox(height: 24),

                // //^ Title Pilih Jadwal & Tooltip
                const TooltipWidget(),
                const SizedBox(height: 8),

                //^ Tanggal
                Consumer<RescedhuleViewModel>(
                  builder: (context, controller, child) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: DatePicker(
                        DateTime.now().add(
                          const Duration(days: 1),
                        ), // start date
                        locale: "in_ID",
                        initialSelectedDate: DateTime.now(),
                        deactivatedColor: grey200,
                        selectionColor: green500,
                        selectedTextColor: grey10,
                        inactiveDates: controller.getSundayHolidays(
                          DateTime.now().year, // 2023
                        ),
                        dayTextStyle: semiBold12Grey300,
                        dateTextStyle: semiBold16Grey300,
                        monthTextStyle: semiBold12Grey300,
                        daysCount: 7,
                        onDateChange: (newDate) {
                          controller.setSelectedDate = newDate;
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Title Pilih Sesi
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Pilih Sesi",
                    style: semiBold14Grey500,
                  ),
                ),
                const SizedBox(height: 8),

                //^ PILIH SESI RESCEDHULE
                Consumer<RescedhuleViewModel>(
                  builder: (context, controller, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.sessions.length, // 3 sesi
                      itemBuilder: (context, index) {
                        var sessionsListData = controller.sessions[index];

                        return GestureDetector(
                          onTap: () {
                            controller.setSelectedSession = sessionsListData;
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
                                      color: controller.selectedSession ==
                                              sessionsListData
                                          ? green500
                                          : grey100,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            sessionsListData.replaceAll(
                                              sessionsListData[0],
                                              sessionsListData[0].toUpperCase(),
                                            ),
                                            style: medium12Grey500,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            () {
                                              //pagi
                                              if (sessionsListData == 'pagi') {
                                                return "(08.00-11.00) WIB";
                                                //siang
                                              } else if (sessionsListData ==
                                                  'siang') {
                                                return "(13.00-15.30) WIB";
                                                // malam
                                              } else {
                                                return "(18.30-20.30) WIB";
                                              }
                                            }(),
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
                                        groupValue: controller.selectedSession,
                                        onChanged: (value) {
                                          controller.setSelectedSession =
                                              value!;
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
                      },
                    );
                  },
                ),

                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),

      //^ ACTION BUTTON
      bottomSheet: Consumer<RescedhuleViewModel>(
        builder: (context, controller, child) {
          var idTransactions = appointmentData?.id ?? '-';

          return Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ButtonComponent(
                labelText: Text(
                  controller.isLoading ? "Proses ..." : "Ganti Jadwal",
                  style: controller.isLoading
                      ? semiBold12Grey300
                      : semiBold12Grey10,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: controller.isLoading ? grey50 : green500,
                elevation: 0,
                onPressed: controller.isButtonValidate()
                    ? () async {
                        // fungsi dijalankan ketika isLoading == false
                        if (controller.isLoading == false) {
                          controller.rescedhule(
                            context: context,
                            idTransactions: idTransactions,
                          );
                        }
                      }
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
