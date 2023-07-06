import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';
import 'package:selling_management/themes/app_themes.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class Notification {
  String title;
  String time;
  String image;

  Notification({required this.title, required this.time, required this.image});
}

class _NotifyState extends State<Notify> {
  List<Notification> data = [
    Notification(
        title: "Thoong bao moiw 1",
        time: "13:30",
        image: "lib/assets/images/shopee_logo.png"),
    Notification(
        title: "Thoong bao moiw 1",
        time: "13:30",
        image: "lib/assets/images/shopee_logo.png"),
    Notification(
        title: "Thoong bao moiw 1",
        time: "13:30",
        image: "lib/assets/images/shopee_logo.png"),
    Notification(
        title: "Thoong bao moiw 1",
        time: "13:30",
        image: "lib/assets/images/shopee_logo.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Thông báo mới'),
        leading: new IconButton(
  icon: new Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () => Navigator.of(context).pop(),
), 
      ),
      body: Container(
        padding: EdgeInsets.only(top:5 ),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              
              return Container(
                  height: 60,
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.bodyHomeColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      CircleAvatar(
                        minRadius: 20,
                        backgroundImage: AssetImage(SHOPEE_LOGO),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data[index].title, style: TextStyle(fontSize: 16),),
                          Text(data[index].time,style: TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
