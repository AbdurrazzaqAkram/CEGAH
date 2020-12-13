import 'package:flutter/material.dart';

class WajibBaca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoard();
  }
}

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List <Widget> _pages = [
    SliderPage(
        title: "Apa yang harus dilakukan jika kamu merasa tertular COVID-19?",
        description:
        "Inilah beberapa tips yang perlu dilakukan",
        image: "assets/images/onboard/1_virus.jpg"),
    SliderPage(
        title: "Tetap berdiam diri di rumah",
        description:
        "- Hindari tempat publik.\n- Istirahat yang cukup dan jaga pola makan dan minum. \n- Hubungi dokter jika kamu merasa kesulitan bernapas.",
        image: "assets/images/onboard/2_rumah.jpg"),
    SliderPage(
        title: "Jaga jarak dengan orang lain",
        description:
        "- Sebisa mungkin diam di satu ruangan. \n- Tutup mulut jika akan bersin atau batuk. \n- Pakai masker jika ada orang lain di sekitar. \n- Cuci tangan sesering mungkin.",
        image: "assets/images/onboard/3_jarak.jpg"),
    SliderPage(
        title: "Perhatikan gejala-mu",
        description:
        "- Gejala COVID-19 diantara lain: Demam, Batuk, Susah bernapas, Sakit dada, Pusing, Susah bangun atau tidur. \n- Jika beberapa atau semua tanda itu kamu rasakan, segera lah hubungi dokter.",
        image: "assets/images/onboard/4_gejala.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Color(0xFF274684)
                                : Color(0xFF274684).withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  (_currentPage == (_pages.length - 1)) ? Navigator.pop(context)
                  : _controller.nextPage(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Color(0xFF274684),
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                    "Kembali",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                      : Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width * 0.4,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}