import 'package:flutter/material.dart';

class CommodityReportWidget extends StatefulWidget {

  @override
  State<CommodityReportWidget> createState() => _CommodityReportWidgetState();
}

class _CommodityReportWidgetState extends State<CommodityReportWidget> {
  
  Map allresponsedata = {
        "success": true,
        "data": [
          {
            "id": 1,
            "read": false,
            "created_at": '12-02-2020T00:00:00',
            "title": 'Dispatch Notification',
            "date": "20221-10-21",
            "body":
                "Commodity with the following details has been dispatched to you: \n Dispatch Ref. = 0001\n Batch No. = 0001\n Commodity = Cerial \n Allocated Quantity = 1000.0\n Quantity = 1000.0\n Truck Plate No. = Supplier Plate No.\n Driver Name = Supplier driver\n Driver Phone = Supplier driver phone\n"
          }
        ]
      };

  @override
  void initState() {
    
    super.initState();
  }
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
                    child: Text(''),
                  ),
                  SizedBox(width: 16),
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
                    SizedBox(width: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 25,
                      alignment: Alignment.centerLeft,
                      child: Text('0001'),
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
                  SizedBox(width: 16),
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
                  SizedBox(width: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Supplier Plate No.'),
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
                  SizedBox(width: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('1000'),
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
                  SizedBox(width: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text('Recieved'),
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
                  SizedBox(width: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text(''),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
