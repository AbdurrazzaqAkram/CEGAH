import 'package:flutter/material.dart';
import 'package:cegah_tim1/widgets/act_list.dart';
import 'package:cegah_tim1/widgets/drawer.dart';


class CegahBosan extends StatefulWidget {
  @override
  _CegahBosanState createState() => _CegahBosanState();
}

class _CegahBosanState extends State<CegahBosan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      iconTheme: IconThemeData(color: Color(0xFF274684)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
          'Cegah Bosan', style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w500,
        color: Color(0xFF274684),
      )
      ),
    ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: 225.0,
              ),
              decoration: BoxDecoration(color: Colors.grey),
              child: Image.asset(
                'assets/images/Banner_Cegah_Bosan.png',
                fit: BoxFit.cover,
              ),
            ),
            actItem("https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/1_memasak.jpg?alt=media&token=fb0e29cd-13b2-41b6-ad1e-12d88a0381ea", "Memasak", "Sebagai hobi, memasak memiliki banyak keuntungan. Mulai dari keuntungan untuk diri sendiri maupun orang lain. Dan memasak memiliki keterpuasan sendiri saat kamu mencicipi hasil masakan kamu sendiri."),
            actItem("https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/2_berkebun.jpg?alt=media&token=34c02671-d0eb-4945-bc05-9505590c1ddb", "Berkebun", "Berkebun merupakan hobi yang menyenangkan. Sepulang kerja atau saat akhir pekan, merupakan saat yang menyenangkan untuk merapikan taman di depan rumah atau di belakang rumah Anda. Kegiatan berkebun selain membuat senang juga mendatangkan banyak manfaat."),
            actItem("https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/3_membaca.jpg?alt=media&token=1b762879-e2bc-4f63-b4b3-510c64317bd1", "Membaca Buku", "Di samping menambah pengetahuan, sering membaca buku ternyata dapat membantu melindungi otak kita tetap sehat dan terhindar dari penyakit seperti Alzheimer."),
            actItem("https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/4_menonton.jpg?alt=media&token=dd42e527-b416-43db-a603-a91322b41386", "Menonton Film", "Ada banyak alasan kenapa banyak orang yang punya hobi menonton film. Selain untuk mengisi waktu luang, menonton bisa mengurangi rasa stres."),
          ],
        ),
      ),
    );
  }
}
