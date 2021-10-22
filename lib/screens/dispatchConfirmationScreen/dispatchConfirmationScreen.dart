import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/screens/dispatchConfirmationScreen/widgets/commodityReportWidget.dart';
import 'package:flutter/material.dart';

class DispatchConfirmationScreen extends StatefulWidget {
  @override
  _DispatchConfirmationScreenState createState() =>
      _DispatchConfirmationScreenState();
}

class _DispatchConfirmationScreenState
    extends State<DispatchConfirmationScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm', style: TextStyle(color: kWhite, fontSize: kTitleBoldFont),),
        backgroundColor: kNavy,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Dispatch Data',
                    style: TextStyle(fontSize: kTitleBoldFont, color: kNavy)),
              ],
            ),
            SizedBox(height: 24),
            CommodityReportWidget(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Confirmation: ',
                    style: TextStyle(fontSize: kTitleBoldFont, color: kNavy)),
              ],
            ),
            SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: kNavy, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: kNavy, width: 2)),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: kNavy, width: 2)),
                  hintText: "Confirmation Code",
                  hintStyle: TextStyle(color: kNavy, fontSize: kNormalFont),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              height: kButtonHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kNavy,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text('Confirm',
                    style:
                        TextStyle(fontSize: kButtonFont, color: Colors.white)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
