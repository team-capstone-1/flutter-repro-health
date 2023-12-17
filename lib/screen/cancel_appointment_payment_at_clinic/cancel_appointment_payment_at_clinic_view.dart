import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/cancel_appointment_payment_at_clinic/cancel_at_clinic_view_model/cancel_at_clinic_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class CancelAppointmentPaymentAtClicic extends StatelessWidget {
  const CancelAppointmentPaymentAtClicic({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as ResponseData;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //^ APPBAR
          SliverAppBar(
            pinned: true,
            elevation: 0,
            stretch: true,
            expandedHeight: 280,
            backgroundColor: grey10,
            leading: Material(
              color: grey10,
              borderRadius: BorderRadius.circular(50),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: grey700,
                ),
              ),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.fadeTitle],
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      appointmentData.consultation?.doctor?.profileImage ?? '-',
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
                Container(
                  padding: const EdgeInsets.all(16),
                  color: grey10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //^ JUDUL Informasi Janji Temu
                      Text(
                        "Informasi Janji Temu",
                        style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 16),

                      //^ Nomer Urut
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nomer Urut",
                            style: regular12Grey400,
                          ),
                          Text(
                            (appointmentData.consultation?.queueNumber ?? 0)
                                .toString(),
                            style: semiBold12Green500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //^ Dokter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dokter",
                            style: regular12Grey400,
                          ),
                          Text(
                            appointmentData.consultation?.doctor?.name ?? '-',
                            style: semiBold12Grey500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //^ Spesialis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Spesialis",
                            style: regular12Grey400,
                          ),
                          Text(
                            appointmentData.consultation?.doctor?.specialist ??
                                '-',
                            style: semiBold12Grey500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //^ Tanggal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tanggal",
                            style: regular12Grey400,
                          ),
                          Text(
                            DateFormat('d MMMM y', 'id_ID').format(
                              appointmentData.consultation?.date ??
                                  DateTime.now(),
                            ),
                            style: semiBold12Grey500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //^ Sesi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sesi",
                            style: regular12Grey400,
                          ),
                          RichText(
                            text: TextSpan(
                              text: appointmentData.consultation?.session
                                  ?.replaceAll(
                                appointmentData.consultation!.session![0],
                                appointmentData.consultation!.session![0]
                                    .toUpperCase(),
                              ),
                              style: semiBold12Grey500,
                              children: [
                                TextSpan(
                                  text: () {
                                    if (appointmentData.consultation?.session ==
                                        'pagi') {
                                      return " (08.00 - 11.00)";
                                    } else if (appointmentData
                                            .consultation?.session ==
                                        'siang') {
                                      return " (13.00-15.30)";
                                    } else {
                                      return " (18.30-20.30)";
                                    }
                                  }(),
                                  style: semiBold12Green500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      //^ Lokasi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Lokasi",
                              style: regular12Grey400,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              appointmentData.consultation?.clinic?.location ??
                                  "-",
                              style: semiBold12Grey500,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: grey50,

      //^ ACTION BUTTON
      bottomSheet: Consumer<CancelAtClinicViewModel>(
        builder: (context, controller, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            color: grey10,
            child: ButtonComponent(
              labelText: Text(
                controller.isLoading ? "Proses ..." : "Batalkan Jadwal",
                style:
                    controller.isLoading ? semiBold12Grey300 : semiBold12Grey10,
                textAlign: TextAlign.center,
              ),
              backgroundColor: controller.isLoading ? grey50 : negative,
              elevation: 0,
              onPressed: () {
                // fungsi dijalankan ketika loading == false
                if (controller.isLoading == false) {
                  controller.cancelTransaction(
                    idTransactions: appointmentData.id,
                    context: context,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
