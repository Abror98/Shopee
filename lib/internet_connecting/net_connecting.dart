import 'package:example1/home/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetConnecting extends StatefulWidget {
  final String usernameController;//if you have multiple values add here
  NetConnecting(this.usernameController, {Key key}): super(key: key);
  @override
  _NetConnectingState createState() => _NetConnectingState();
}

class _NetConnectingState extends State<NetConnecting> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
          children: [
            Container(
              height: 300,
              child: SizedBox.expand(
                child: FittedBox(
                  child: Image.asset('assets/img/no_internet_image.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Center(child: Text('No Internet', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
            Center(child: Text('Please check your connection status and try again')),
            SizedBox(height: 30),
            Center(
                child: ButtonTheme(
                  minWidth: 266,
                  height: 46,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if(widget.usernameController == '1')
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BasePage()));
                      else
                      Navigator.pop(context);
                    },
                    child: Text("Close", style: TextStyle(color: Colors.white),),
                  ),
              ),
            )
          ],
        ),
    );
  }
}
