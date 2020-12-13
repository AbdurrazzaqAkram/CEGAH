import 'package:flutter/material.dart';

class TipsMencegah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TipsView();
  }
}

class TipsView extends StatefulWidget {
  @override
  _TipsViewState createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List <Widget> _pages = [
    TipsPage(
        image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F01_covid19.jpg?alt=media&token=89c30a12-287c-40d2-a1f5-d8aa905bf495",
        description:
        "Pencegahan Penyebaran Covid-19",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F02_cucitangan.jpg?alt=media&token=1c87fcdb-d34d-44ad-86ce-18669b95de71",
      description:
      "Cucilah tangan dengan sabun dan air untuk meminimalkan risiko infeksi.",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F03_menggaruk.jpg?alt=media&token=6539e7f5-e23f-42a1-8816-996890a2cd9f",
      description:
      "Jauhkan tangan dari mata, hidung, dan mulut.",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F04_bersin.jpg?alt=media&token=3571cbbc-f101-46ca-8c49-83332f0cb7c5",
      description:
      "Jauhi orang-orang yang bersin dan batuk.",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F05_jabattangan.jpg?alt=media&token=d12a5586-2899-444b-93e8-37437a926b92",
      description:
      "Hindari berjabat tangan.",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F06_peralatanrumah.jpg?alt=media&token=1d4545bc-6692-4b53-980e-c6b9eecc4ce6",
      description:
      "Disinfeksi permukaan yang sering disentuh setiap hari menggunakan produk pembunuh virus.",
    ),
    TipsPage(
      image: "https://firebasestorage.googleapis.com/v0/b/cegah-tim-1-20923.appspot.com/o/Tips%2F07_cucian.jpg?alt=media&token=2326b85c-44f3-4d0c-9816-3c3c37cf62fe",
      description:
      "Cuci seluruh pakaian dengan air panas untuk membunuh kuman.",
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF274684),
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
                                ? Colors.white
                                : Colors.white.withOpacity(0.5)));
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                    "Kembali",
                    style: TextStyle(
                      color: Color(0xFF274684),
                      fontSize: 20,
                    ),
                  )
                      : Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Color(0xFF274684),
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

class TipsPage extends StatelessWidget {
  final String description;
  final String image;

  TipsPage({this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xFF274684),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            image,
            width: width,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                height: 2.0,
                fontWeight: FontWeight.w800,
                fontSize: 16,
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