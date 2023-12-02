import 'package:reprohealth_app/models/riwayat_models/doctor_models.dart';

class Transaction {
  final String? paymentStatus;
  final String? appointmentStatus;
  final String? invoice;
  final String? transactionDate;
  final int? queueNumber;
  final String? clinic;
  final String? location;
  final List<DoctorModels>? doctor;
  final bool isDoctorAvailable;
  final String? appointmentDate;
  final String? session;
  final String? paymentMethod;
  final int? price;
  final int? adminFee;
  final int? totalBill;

  Transaction({
    required this.paymentStatus,
    required this.appointmentStatus,
    required this.invoice,
    required this.transactionDate,
    required this.queueNumber,
    required this.clinic,
    required this.location,
    required this.doctor,
    required this.appointmentDate,
    required this.session,
    required this.paymentMethod,
    required this.price,
    required this.adminFee,
    required this.totalBill,
    required this.isDoctorAvailable,
  });
}

//^ DIPROSES
List<Transaction> appointmentOnProcess = [
  //^TRANSFER MANUAL - BERHASIL
  Transaction(
    paymentStatus: "Berhasil",
    appointmentStatus: "Diproses",
    invoice: "IN/20231119/30",
    transactionDate: "19 November 2023",
    queueNumber: 30,
    clinic: "Mediatama",
    location: "Jl. Imam Bonjol No, 42, Kota Semarang",
    doctor: [
      DoctorModels(
        name: "Dr. Tomy Wijaya, SpOG, FPMRS",
        specialist: "Dokter kandungan",
        avatar:
            "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 2 Desember 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Transfer Manual",
    price: 300000,
    adminFee: 10000,
    totalBill: 310000,
  ),
  //^TRANSFER MANUAL - TERTUNDA
  Transaction(
    paymentStatus: "Tertunda",
    appointmentStatus: "Diproses",
    invoice: "IN/20231113/18",
    transactionDate: "13 November 2023",
    queueNumber: 18,
    clinic: "Cipta Medika",
    location: "Jl. Suyudi No, 103, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://plus.unsplash.com/premium_photo-1664475450083-5c9eef17a191?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        name: "Dr. Rina Diana Winta, Sp.D.V.E",
        specialist: "Dokter Kulit & Kelamin",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Jumat, 29 November 2023",
    session: "Siang (13.00-15.30)",
    paymentMethod: "Transfer Manual",
    price: 90000,
    adminFee: 10000,
    totalBill: 95000,
  ),
  //^TRANSFER MANUAL - TERTUNDA
  Transaction(
    paymentStatus: "Tertunda",
    appointmentStatus: "Diproses",
    invoice: "IN/20231102/17",
    transactionDate: "02 November 2023",
    queueNumber: 17,
    clinic: "Cipta Medika",
    location: "Jl. Suyudi No, 103, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://plus.unsplash.com/premium_photo-1664475450083-5c9eef17a191?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        name: "Dr. Rina Diana Winta, Sp.D.V.E",
        specialist: "Dokter Kulit & Kelamin",
      ),
    ],
    isDoctorAvailable: false,
    appointmentDate: "Kamis, 28 November 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Transfer Manual",
    price: 100000,
    adminFee: 10000,
    totalBill: 110000,
  ),
  //^TRANSFER MANUAL - REFUND
  Transaction(
    paymentStatus: "Refund",
    appointmentStatus: "Diproses",
    invoice: "IN/20231029/32",
    transactionDate: "29 Oktober 2023",
    queueNumber: 32,
    clinic: "Theresia",
    location: "Jl. Pandanaran No.11, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://img.freepik.com/free-photo/cheerful-doctor-gesturing-thumb-up_23-2147896156.jpg?w=996&t=st=1700078498~exp=1700079098~hmac=1cc3d9a28d479b4d5f5dcf23e0f652a73a085e7391194023eb014adfe408abb2",
        name: "Dr. Yuri Ardiansyah, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 21 November 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Transfer Manual",
    price: 100000,
    adminFee: 10000,
    totalBill: 110000,
  ),

  //^BAYAR DIKLNIKIK - BERHASIL
  Transaction(
    paymentStatus: "Berhasil",
    appointmentStatus: "Diproses",
    invoice: "IN/20231019/07",
    transactionDate: "19 Oktober 2023",
    queueNumber: 07,
    clinic: "Esensia",
    location: "Jl. Wolter Wonginsidi No.17, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://linguava.com/wp-content/uploads/2020/07/portrait-of-smiling-black-female-doctor-in-hijab-a-XMNLLFX-300x171.jpg",
        name: "Dr. Aliyah Syiffa, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 23 Oktober 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Bayar Diklinik",
    price: 250000,
    adminFee: 10000,
    totalBill: 260000,
  ),
  //^BAYAR DIKLINIK - TERTUNDA
  Transaction(
    paymentStatus: "Tertunda",
    appointmentStatus: "Diproses",
    invoice: "IN/20231029/12",
    transactionDate: "19 Oktober 2023",
    queueNumber: 32,
    clinic: "Kramat Jaya",
    location: "Jl. Wahidin No, 42, Medan",
    doctor: [
      DoctorModels(
        avatar:
            "https://img.freepik.com/free-photo/cheerful-doctor-gesturing-thumb-up_23-2147896156.jpg?w=996&t=st=1700078498~exp=1700079098~hmac=1cc3d9a28d479b4d5f5dcf23e0f652a73a085e7391194023eb014adfe408abb2",
        name: "Dr. Yuri Ardiansyah, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: false,
    appointmentDate: "Senin, 23 Oktober 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Bayar Diklinik",
    price: 100000,
    adminFee: 10000,
    totalBill: 110000,
  ),
];

//^ SELESAI
List<Transaction> appointmentSucces = [
  //^TRANSFER MANUAL
  Transaction(
    paymentStatus: "Berhasil",
    appointmentStatus: "Selesai",
    invoice: "IN/20231029/12",
    transactionDate: "11 Oktober 2023",
    queueNumber: 10,
    clinic: "Theresia",
    location: "Jl. Ahmad Yani, No.407, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://media.istockphoto.com/id/1346711310/photo/portrait-of-smiling-female-doctor-wearing-uniform-standing.webp?b=1&s=170667a&w=0&k=20&c=MP4Uz3zLO_2i8WGmcYaQgz8mOh2IrRjf5byFhqKRroY=",
        name: "Dr. Arfa Sabila, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 24 November 2023",
    session: "Siang (13.00-15.30)",
    paymentMethod: "Transfer Manual",
    price: 200000,
    adminFee: 10000,
    totalBill: 210000,
  ),
  //^BAYAR DIKLINIK
  Transaction(
    paymentStatus: "Berhasil",
    appointmentStatus: "Selesai",
    invoice: "IN/20231029/12",
    transactionDate: "19 Oktober 2023",
    queueNumber: 32,
    clinic: "Kramat Jaya",
    location: "Jl. Wahidin No, 42, Medan",
    doctor: [
      DoctorModels(
        avatar:
            "https://img.freepik.com/free-photo/cheerful-doctor-gesturing-thumb-up_23-2147896156.jpg?w=996&t=st=1700078498~exp=1700079098~hmac=1cc3d9a28d479b4d5f5dcf23e0f652a73a085e7391194023eb014adfe408abb2",
        name: "Dr. Yuri Ardiansyah, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 23 Oktober 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Bayar Diklinik",
    price: 100000,
    adminFee: 10000,
    totalBill: 110000,
  ),
];

//^ BATAL
List<Transaction> appointmentCancel = [
  //^TRANSFER MANUAL
  Transaction(
    paymentStatus: "Transaksi Gagal",
    appointmentStatus: "Batal",
    invoice: "IN/20231029/12",
    transactionDate: "11 Oktober 2023",
    queueNumber: 10,
    clinic: "Theresia",
    location: "Jl. Ahmad Yani, No.407, Kota Semarang",
    doctor: [
      DoctorModels(
        avatar:
            "https://media.istockphoto.com/id/1346711310/photo/portrait-of-smiling-female-doctor-wearing-uniform-standing.webp?b=1&s=170667a&w=0&k=20&c=MP4Uz3zLO_2i8WGmcYaQgz8mOh2IrRjf5byFhqKRroY=",
        name: "Dr. Arfa Sabila, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 24 November 2023",
    session: "Siang (13.00-15.30)",
    paymentMethod: "Transfer Manual",
    price: 200000,
    adminFee: 10000,
    totalBill: 210000,
  ),
  //^BAYAR DIKLINIK
  Transaction(
    paymentStatus: "Janji Temu Dibatalkan",
    appointmentStatus: "Batal",
    invoice: "IN/20231029/12",
    transactionDate: "19 Oktober 2023",
    queueNumber: 32,
    clinic: "Kramat Jaya",
    location: "Jl. Wahidin No, 42, Medan",
    doctor: [
      DoctorModels(
        avatar:
            "https://img.freepik.com/free-photo/cheerful-doctor-gesturing-thumb-up_23-2147896156.jpg?w=996&t=st=1700078498~exp=1700079098~hmac=1cc3d9a28d479b4d5f5dcf23e0f652a73a085e7391194023eb014adfe408abb2",
        name: "Dr. Yuri Ardiansyah, SpOG",
        specialist: "Dokter kandungan",
      ),
    ],
    isDoctorAvailable: true,
    appointmentDate: "Senin, 23 Oktober 2023",
    session: "Pagi (08.00-11.00)",
    paymentMethod: "Bayar Diklinik",
    price: 100000,
    adminFee: 10000,
    totalBill: 110000,
  ),
];
