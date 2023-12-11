import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/models/notification_models.dart';
// import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/notification/view_model/get_notification_view_model.dart';
import 'package:reprohealth_app/screen/notification/widget/leading_icon_widget.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/riwayat/widget/chip_appointment_length_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final myProfile =
          Provider.of<GetFamilyProfileViewModel>(context, listen: false)
              .profileList
              ?.response
              ?.first;
      Provider.of<GetNotificationViewModel>(context, listen: false)
          .fetchNotification(context: context, idPatients: myProfile?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationLength =
        Provider.of<GetNotificationViewModel>(context, listen: false)
            .notificationList
            ?.response
            ?.length;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: grey10,
        appBar: AppBar(
          backgroundColor: grey10,
          title: Text(
            "Notifikasi",
            style: semiBold16Grey700,
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: secondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // bottom: TabBar(
          //   labelColor: green800,
          //   labelStyle: medium14Green800,
          //   unselectedLabelColor: grey200,
          //   indicatorWeight: 3,
          //   indicatorColor: green800,
          //   tabs: [
          //     //^ Janji Temu
          //     Tab(
          //       child: appointmentOnProcess.isNotEmpty
          //           ? ChipAppointmentLengthWidget(
          //               text: "Janji Temu",
          //               length: 0,
          //             )
          //           : const Text("Janji Temu"),
          //     ),

          //     //^ Forum
          //     Tab(
          //       child: appointmentSucces.isNotEmpty
          //           ? ChipAppointmentLengthWidget(
          //               text: "Forum",
          //               length: 0,
          //             )
          //           : const Text("Forum"),
          //     ),

          //     //^ Info
          //     Tab(
          //       child: appointmentCancel.isNotEmpty
          //           ? ChipAppointmentLengthWidget(
          //               text: "Info",
          //               length: notificationLength?? 0,
          //             )
          //           : const Text("Info"),
          //     ),
          //   ],
          // ),
        ),
        body: Consumer<GetNotificationViewModel>(
          builder: (context, getNotificationViewModel, child) {
            final listNotification = getNotificationViewModel.notificationList;
            return TabBarView(
              children: [
                //^ Janji Temu
                Center(
                  child: Image.asset(
                    Assets.assetsNotificationEmpty,
                  ),
                ),

                //^ Forum
                Center(
                  child: Image.asset(
                    Assets.assetsNotificationEmpty,
                  ),
                ),

                //^ Info
                ListView.separated(
                  itemCount: listNotification?.response?.length ?? 0,
                  itemBuilder: (context, index) {
                    var notificationData = listNotification?.response?[index];
                    if (notificationData?.category == Category.INFO &&
                        notificationData?.category != null) {
                      return ListTile(
                          contentPadding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 6),
                          leading: IconWidget(
                            icon: Icons.person_outline,
                          ),
                          title: Text(
                            notificationData?.title ?? "",
                            style: medium12Grey900,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                notificationData?.content ?? "",
                                style: regular10Grey900,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                notificationData?.date != null
                                    ? DateFormat('dd MMMM yyyy', "id")
                                        .format(notificationData!.date!)
                                    : 'No date available',
                                style: regular8Grey900,
                              )
                            ],
                          ));
                    } else {
                      return Center(child: Text("Tidak ada data"));
                    }
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }

  //^ LIST DATA KOSONG
  Container buildEmptyData() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: grey10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            color: grey100,
          ),
          const SizedBox(height: 16),
          Text(
            "Belum Ada Notifikasi",
            style: semiBold14Grey400,
          ),
        ],
      ),
    );
  }
}
