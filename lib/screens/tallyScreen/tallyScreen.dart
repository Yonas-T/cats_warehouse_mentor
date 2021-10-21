import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:flutter/material.dart';

class TallyScreen extends StatefulWidget {
  @override
  _TallyScreenState createState() => _TallyScreenState();
}

class _TallyScreenState extends State<TallyScreen> {
  bool _isLoggingDamagedUnits = false;
  List<String> damageReasons = [];
  int commodityAmount = 0;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    commodityAmount = 0;
    super.initState();
  }

  showAlertDialog(BuildContext context, String title) {
    // set up the AlertDialog
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(fontSize: 18, color: kNavy)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(title),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        child: ListView(
          // crossAxisCount: 2,
          // mainAxisSpacing: 6,
          // crossAxisSpacing: 6,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  damageReasons.add('Unpacked');
                });
              },
              child: Container(
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Unpacked',
                      style: TextStyle(fontSize: 18, color: kNavy))),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  damageReasons.add('Package Teared');
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Package Teared',
                    style: TextStyle(fontSize: 18, color: kNavy)),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  damageReasons.add('Wet');
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Text('Wet', style: TextStyle(fontSize: 18, color: kNavy)),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  damageReasons.add('Other');
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Text('Other', style: TextStyle(fontSize: 18, color: kNavy)),
              ),
            ),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavy,
      ),
      body: Container(
        // margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xfff5f5f5)),
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          // childrenPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      // filled: true,
                      // fillColor: kWhite,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: kNavy, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: kNavy, width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: kNavy, width: 2)),
                      hintText: "Enter count size",
                      hintStyle: TextStyle(color: kNavy, fontSize: kNormalFont),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: kNavy,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    child: Text(
                      'Enter',
                      style: TextStyle(fontSize: kButtonFont, color: kWhite),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 32),
            Container(
              child: Text(
                "Good Items",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kTitleBoldFont, color: kNavy),
              ),
              padding: EdgeInsets.only(bottom: 20),
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.8,
              color: kNavy,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: kNavy,
                  child: IconButton(
                      icon: Icon(Icons.remove, color: Colors.white),
                      onPressed: () {}
                      // setState(() {
                      //   commodityAmount =
                      //       commodityAmount != 0 ? commodityAmount - 1 : 0;
                      // });

                      ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  child:
                      // BlocBuilder<CounterBloc, int>(
                      //   builder: (BuildContext context, int state) {
                      //     return
                      Text(
                    "0",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: kTitleBoldFont, color: kNavy),
                  ),
                  //   },
                  // ),
                ),
                CircleAvatar(
                  backgroundColor: kNavy,
                  child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {}
                      // _counterBloc.add(CounterEvents.increment);
                      // setState(() {
                      //   commodityAmount = commodityAmount + 1;
                      // });

                      ),
                ),
              ],
            ),
            // SizedBox(height: 16),
            Container(
              child: Text(
                "Damaged Units",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kNormalFont, color: kNavy),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffD85D50),
                  child: IconButton(
                      icon: Icon(Icons.remove, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          commodityAmount =
                              commodityAmount != 0 ? commodityAmount - 1 : 0;
                        });
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  child: Text(
                    "$commodityAmount",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: kLargeFont, color: kNavy),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xffD85D50),
                  child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          commodityAmount = commodityAmount + 1;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.only(left: 8),
                height: 70,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text('Delivered',
                                style: TextStyle(
                                    color: kNavy,
                                    fontSize: kNormalFont,
                                    fontWeight: FontWeight.bold))),
                        Text('Counted',
                            style: TextStyle(
                                color: kNavy,
                                fontSize: kNormalFont,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text('100',
                                style: TextStyle(
                                    color: kNavy, fontSize: kNormalFont))),
                        Text('100',
                            style:
                                TextStyle(color: kNavy, fontSize: kNormalFont)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context, 'Remark');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffD85D50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: Text(
                    'Remark',
                    style: TextStyle(fontSize: kButtonFont, color: kWhite),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: kButtonHeight,
                color: kNavy,
                alignment: Alignment.center,
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: kButtonFont, color: kWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}