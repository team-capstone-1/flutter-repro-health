import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/models/notification_models.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/screen/notification/view_model/get_notification_view_model.dart';
import 'package:reprohealth_app/screen/notification/widget/leading_icon_widget.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/riwayat/widget/chip_appointment_length_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final myProfile = Provider.of<GetFamilyProfileViewModel>(context, listen: false).profileList?.response?.first;
      Provider.of<GetNotificationViewModel>(context, listen: false).fetchNotification(context: context, idPatients: myProfile?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    int getNotificationLengthByCategory(GetNotificationViewModel viewModel, Category category) {
    final notificationList = viewModel.notificationList;
    return notificationList?.response?.where((notification) => notification.category == category).length ?? 0;
  }
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
          bottom: TabBar(
            labelColor: green800,
            labelStyle: medium14Green800,
            unselectedLabelColor: grey200,
            indicatorWeight: 3,
            indicatorColor: green800,
            tabs: [
            //^ Janji Temu
              Tab(
                child: Consumer<GetNotificationViewModel>(
                  builder: (context, getNotificationViewModel, child) {
                    final janjiTemuLength = getNotificationLengthByCategory(getNotificationViewModel, Category.JANJI_TEMU);

                    return janjiTemuLength > 0
                    ? ChipAppointmentLengthWidget(
                        text: "Janji Temu",
                        length: janjiTemuLength,
                      )
                    : Text("Janji Temu",);
              },
            ),
          ),

              //^ Forum
              Tab(
                child: Consumer<GetNotificationViewModel>(
                  builder: (context, getNotificationViewModel, child) {
                    final forumLength = getNotificationLengthByCategory(getNotificationViewModel, Category.FORUM);

                    return forumLength > 0
                    ? ChipAppointmentLengthWidget(
                        text: "Forum",
                        length: forumLength,
                      )
                    : Text("Forum",);
              },
            ),
          ),

              //^ Info
              Tab(
                child: Consumer<GetNotificationViewModel>(
                  builder: (context, getNotificationViewModel, child) {
                    final infoLength = getNotificationLengthByCategory(getNotificationViewModel, Category.INFO);

                    return infoLength > 0
                    ? ChipAppointmentLengthWidget(
                        text: "Info",
                        length: infoLength,
                      )
                    : Text("Info",);
              },
            ),
          ),
            ],
          ),
        ),
        body: Consumer<GetNotificationViewModel>(
          builder: (context, getNotificationViewModel, child) {
            final listNotification = getNotificationViewModel.notificationList;
            return TabBarView(
              children: [
                // Janji Temu
                _buildTabContent(Category.JANJI_TEMU, listNotification),

                // Forum
                _buildTabContent(Category.FORUM, listNotification),

                // Info
                _buildTabContent(Category.INFO, listNotification),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabContent(Category category, NotificationModel? listNotification) {
  var forumViewModel = Provider.of<ForumViewModel>(context, listen: false);

  if (listNotification == null || listNotification.response == null) {
    return Center(
      child: Image.asset(Assets.assetsNotificationEmpty),
    );
  }

  final filteredNotifications = listNotification.response!
      .where((notification) => notification.category == category)
      .toList();

  if (filteredNotifications.isEmpty) {
    return Center(
      child: Image.asset(Assets.assetsNotificationEmpty),
    );
  }

  return ListView.separated(
    itemCount: filteredNotifications.length,
    itemBuilder: (context, index) {
      final notificationData = filteredNotifications[index];
      return ListTile(
        contentPadding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 6),
        leading: IconWidget(
          icon: Icons.person_outline,
        ),
        title: Text(
          notificationData.title ?? "",
          style: medium12Grey900,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              notificationData.content ?? "",
              style: regular10Grey900,
            ),
            SizedBox(height: 4),
            Text(
              notificationData.date != null
                  ? "${forumViewModel.calculateDaysAgo(notificationData.date!)} yang lalu"
                  : 'No date available',
              style: regular8Grey900,
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) {
      return const Divider(
        indent: 20,
        endIndent: 20,
        thickness: 1,
      );
    },
  );
}
}