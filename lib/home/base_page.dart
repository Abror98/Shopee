import 'package:connectivity/connectivity.dart';
import 'package:example1/cart/cart_empty_page.dart';
import 'package:example1/const/static_values.dart';
import 'package:example1/internet_connecting/net_connecting.dart';
import 'package:example1/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:example1/stores/login_store.dart';
import 'package:example1/cart/cart_page.dart';
import 'package:example1/const/constant.dart';
import 'package:example1/details/detail_screen.dart';
import 'package:example1/home/gridview.dart';
import 'package:example1/models/clothes_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/foundation.dart';



Future<List<Clothes>> fetchPhotos(http.Client client) async {
  var url = Uri.https("abroruz98.000webhostapp.com" , "/man_clothes");
  var response = await client.get(url);
  if(response.statusCode == 200){
    dynamic parsedjson = jsonDecode(response.body);
    return compute(parsePhotos, response.body.toString());
  }
  // Use the compute function to run parsePhotos in a separate isolate.
}

// A function that converts a response body into a List<Photo>.
List<Clothes> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Clothes>((json) => Clothes.fromJson(json)).toList();
}


class BasePage extends StatefulWidget {
  const BasePage({Key key}) : super(key: key);
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  bool iswificonnected = false;
  bool isInternetOn = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetConnect(); // calls getconnect method to check which type if connection it
  }

  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {

      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {

      iswificonnected = true;

    }
  }

  List<Widget> containers = [
    new FutureBuilder<List<Clothes>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if(snapshot.hasError)
          print('salom' + snapshot.error);
        return  snapshot.hasData?
        ClothesList(photos: snapshot.data.sublist(0, 6), count: 6)
            : new Center(child: new CircularProgressIndicator());

      },
    ),

     new FutureBuilder<List<Clothes>>(
       future: fetchPhotos(http.Client()),
       builder: (context, snapshot) {
         if(snapshot.hasError)
           print(snapshot.error);
         return
           snapshot.hasData?
           ClothesList(photos: snapshot.data.sublist(6, 12), count: 6)
               : new Center(child: new CircularProgressIndicator());

       },
     ),

     new FutureBuilder<List<Clothes>>(
       future: fetchPhotos(http.Client()),
       builder: (context, snapshot) {
         if(snapshot.hasError)
           print(snapshot.error.toString());
         return
           snapshot.hasData?
           ClothesList(photos: snapshot.data.sublist(12, 18), count: 6)
               : new Center(child: new CircularProgressIndicator());
       },
     ),
    new FutureBuilder<List<Clothes>>(
       future: fetchPhotos(http.Client()),
       builder: (context, snapshot) {
         if(snapshot.hasError)
           print(snapshot.error);
         return
           snapshot.hasData?
           ClothesList(photos: snapshot.data.sublist(18, 22), count: 4)
               : new Center(child: new CircularProgressIndicator());

       },
     ),
    new FutureBuilder<List<Clothes>>(
       future: fetchPhotos(http.Client()),
       builder: (context, snapshot) {
         if(snapshot.hasError)
           print(snapshot.error);
         return
           snapshot.hasData?
           ClothesList(photos: snapshot.data.sublist(22, 26), count: 4)
               : new Center(child: new CircularProgressIndicator());

       },
     )

  ];



  @override
  Widget build(BuildContext context) {
    return isInternetOn ? buildConsumer(context) : iswificonnected ? buildConsumer(context) : new NetConnecting('1');
  }

  Consumer<LoginStore> buildConsumer(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {   ///   loginStore.signOut(context);
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: SvgPicture.asset('assets/icons/back.svg'),
                onPressed: (){

                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: SvgPicture.asset('assets/icons/search.svg',
                      color: kTextColor),
                  onPressed: (){},
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/cart.svg',
                    color: kTextColor,
                  ),
                  onPressed: (){
                    if(MyStaticValues.myObjectList.length > 0)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (PageWithAnimatedList())));
                    else  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (CartEmpty())));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.info, color: Colors.black,),
                  onPressed: () {
                    navigateToAoutPage(context);
                  },
                ),
                SizedBox(width: kDefaultPaddin / 4,),

              ],

              bottom: new PreferredSize(

                preferredSize: new Size(70.0, 70.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Men", style: Theme.of(context).textTheme.headline5
                              .copyWith(fontWeight: FontWeight.bold),

                          ),
                        ),
                      ),
                    ),
                    TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      labelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          text: categories[0],
                        ),
                        Tab(
                          text: categories[1],
                        ),
                        Tab(
                          text: categories[2],
                        ),
                        Tab(
                          text: categories[3],
                        ),
                        Tab(
                          text: categories[4],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: containers,
            ),
          ),
        );
      }
  );
  }

  void navigateToAoutPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutPage();
    }));
  }


}
