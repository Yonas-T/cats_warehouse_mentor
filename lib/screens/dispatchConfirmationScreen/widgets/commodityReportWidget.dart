import 'package:flutter/material.dart';

class CommodityReportWidget extends StatelessWidget {
  const CommodityReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Title'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
            Container(
                color: Colors.grey[200],
                height: 25,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 25,
                      alignment: Alignment.centerRight,
                      child: Text('Ref. No'),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 25,
                      alignment: Alignment.centerLeft,
                      child: Text('Amount'),
                    )
                  ],
                )),
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Transporter name'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Plate no'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Quantity'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Status'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              height: 25,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerRight,
                    child: Text('Remark'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Amount'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
