import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cano 0440',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://www.redtool.com.mx/wp-content/uploads/2020/10/2802-20.png",
    "https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e79d0d73-264a-4b79-a157-ae1cea21faf1.1ce545dd43c8f6e4e6d75d8df6ba1388.png?odnHeight=2000&odnWidth=2000&odnBg=ffffff",
    "https://boschstore.com.mx/wp-content/uploads/2021/11/06014736G0.png",
    "https://i5.walmartimages.com.mx/mg/gm/3pp/asr/3eae4e5f-42fd-4b2a-9c89-9e5f36e87dd7.eef8762b38841216a959d0a5a351667b.png?odnHeight=612&odnWidth=612&odnBg=FFFFFF",
    "https://1eef39c98840285810bd-2595d34d3de4180b13df22f453ac5c69.ssl.cf1.rackcdn.com/product/photos/large_6da39382-7605-48cd-82dc-5bfd4abaf3a2.png",
    "https://makita.bo/wp-content/uploads/2021/12/XPH15RB_StillPhoto.png"
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffbebebe),
      appBar: AppBar(
        backgroundColor: const Color(0xffff1e1e),
        title: const Text(
          "Ferreteria Arellano 0429",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator(),
            const Text(
              "Tenemos variedad de marcas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == _currentPage
                  ? const Color(0xffffffff)
                  : const Color(0xff848484),
              shape: BoxShape.circle),
        )
    ]);
  }
}
