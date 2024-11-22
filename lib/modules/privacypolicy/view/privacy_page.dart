import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Kebijakan Privasi", 
            isCircle: true,
            isPrimary: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
            delegate: SliverChildListDelegate([
              Html(
              data: '<p>Aplikasi MHS dimiliki oleh Metro Hotel School, yang akan menjadi pengontrol atas data pribadi Anda.</p><p>Kami telah mengadopsi Kebijakan Privasi ini untuk menjelaskan bagaimana kami memproses informasi yang dikumpulkan oleh Aplikasi MHS, yang juga menjelaskan alasan mengapa kami perlu mengumpulkan data pribadi tertentu tentang Anda. Oleh karena itu, Anda harus membaca Kebijakan Privasi ini sebelum menggunakan Aplikasi MHS.</p><p>Kami menjaga data pribadi Anda dan berjanji untuk menjamin kerahasiaan dan keamanannya.</p><p>Informasi pribadi yang kami kumpulkan:<br />Saat Anda mengunjungi Aplikasi MHS, kami secara otomatis mengumpulkan informasi tertentu mengenai perangkat Anda, termasuk informasi tentang browser web, alamat IP, zona waktu, dan sejumlah cookie yang terinstal di perangkat Anda. Selain itu, selama Anda menjelajahi Aplikasi MHS, kami mengumpulkan informasi tentang setiap halaman pada Aplikasi MHS atau produk yang Anda lihat. Kami menyebut informasi yang dikumpulkan secara otomatis ini sebagai "Informasi Perangkat". Kemudian, kami mungkin akan mengumpulkan data pribadi yang Anda berikan kepada kami (termasuk tetapi tidak terbatas pada, Nama, Nama belakang, Alamat, informasi pembayaran, dll.) selama pendaftaran untuk dapat memenuhi perjanjian.</p><p>Mengapa kami memproses data Anda?<br />Menjaga data pelanggan agar tetap aman adalah prioritas utama kami. Oleh karena itu, kami hanya dapat memproses sejumlah kecil data pengguna, sebanyak yang benar-benar diperlukan untuk menjalankan Aplikasi MHS. Informasi yang dikumpulkan secara otomatis hanya digunakan untuk mengidentifikasi kemungkinan kasus penyalahgunaan dan menyusun informasi statistik terkait penggunaan Aplikasi MHS. Informasi statistik ini tidak digabungkan sedemikian rupa hingga dapat mengidentifikasi pengguna tertentu dari sistem.<br />Anda dapat mengunjungi Aplikasi MHS tanpa memberi tahu kami identitas Anda atau mengungkapkan informasi apa pun, yang dapat digunakan oleh seseorang untuk mengidentifikasi Anda sebagai individu tertentu yang dapat dikenali. Namun, jika Anda ingin menggunakan beberapa fitur pada Aplikasi MHS, atau Anda ingin menerima newsletter kami atau memberikan detail lainnya dengan mengisi formulir, Anda dapat memberikan data pribadi kepada kami, seperti email, nama depan, nama belakang, kota tempat tinggal, organisasi, dan nomor telepon Anda. Anda dapat memilih untuk tidak memberikan data pribadi Anda kepada kami, tetapi Anda mungkin tidak dapat memanfaatkan beberapa fitur Aplikasi MHS. Contohnya, Anda tidak akan dapat menerima Newsletter kami atau menghubungi kami secara langsung dari Aplikasi MHS. Pengguna yang tidak yakin tentang informasi yang wajib diberikan dapat menghubungi kami melalui Aplikasi MHS.</p><p>Keamanan informasi:<br />Kami menjaga keamanan informasi yang Anda berikan pada server komputer dalam lingkungan yang terkendali, aman, dan terlindungi dari akses, penggunaan, atau pengungkapan yang tidak sah. Kami menjaga pengamanan administratif, teknis, dan fisik yang wajar untuk perlindungan terhadap akses, penggunaan, modifikasi, dan pengungkapan tidak sah atas data pribadi dalam kendali dan pengawasannya. Namun, kami tidak menjamin tidak akan ada transmisi data melalui Internet atau jaringan nirkabel.</p><p>Pengungkapan hukum:<br />Kami akan mengungkapkan informasi apa pun yang kami kumpulkan, gunakan, atau terima jika diwajibkan atau diizinkan oleh hukum, misalnya untuk mematuhi panggilan pengadilan atau proses hukum serupa, dan jika kami percaya dengan itikad baik bahwa pengungkapan diperlukan untuk melindungi hak kami, melindungi keselamatan Anda atau keselamatan orang lain, menyelidiki penipuan, atau menanggapi permintaan dari pemerintah.</p><p>Informasi kontak:<br />Jika Anda ingin menghubungi kami untuk mempelajari Kebijakan ini lebih lanjut atau menanyakan masalah apa pun yang berkaitan dengan hak perorangan dan Informasi pribadi Anda, Anda dapat melalui Aplikasi&nbsp;MHS.&nbsp;</p>',
              style: {
                "a": Style(
                  color: Colors.blue,
                ),
              },
              onLinkTap: (String? url, Map<String, String> attributes, element) async {
                WebViewRoute(url: url!, title: "MHS-MOBILE").go(context);
              },
            )
            ])
          ),
          )
        ],
      ),
    );
  }
}