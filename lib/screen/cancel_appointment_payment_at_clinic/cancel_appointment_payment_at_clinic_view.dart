import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';

class CancelAppointmentPaymentAtClicic extends StatelessWidget {
  const CancelAppointmentPaymentAtClicic({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as Transaction;
    int indexDoctor = 0;

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
                            (appointmentData.queueNumber ?? 0).toString(),
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
                            appointmentData.doctor?[indexDoctor].name ?? '-',
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
                            appointmentData.doctor?[indexDoctor].specialist ??
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
                            appointmentData.appointmentDate ?? '-',
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
                              text: (appointmentData.session ?? '-')
                                  .replaceAll(RegExp(r'[0-9().-]'), ''),
                              style: semiBold12Grey500,
                              children: [
                                TextSpan(
                                  text: (appointmentData.session ?? '-')
                                      .replaceAll(RegExp(r'[a-zA-Z]'), ''),
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
                          Text(
                            "Lokasi",
                            style: regular12Grey400,
                          ),
                          Text(
                            appointmentData.location ?? "-",
                            style: semiBold12Grey500,
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
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        color: grey10,
        child: ButtonComponent(
          labelText: Text(
            "Batalkan Jadwal",
            style: semiBold12Primary,
            textAlign: TextAlign.center,
          ),
          backgroundColor: negative,
          elevation: 0,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesNavigation.confirmStatusView,
              (route) => route.isFirst,
              arguments: 'Berhasil Membatalkan Janji Temu',
            );
          },
        ),
      ),
    );
  }
}
