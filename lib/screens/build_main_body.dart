import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'single_page.dart';

class BuildMainBody extends StatelessWidget {
  const BuildMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/ambulance.png'),
                      width: 40,
                      height: 49,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Nearby Blood Bank",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          style: BorderStyle.solid,
                          color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          style: BorderStyle.solid,
                          color: Colors.white70),
                    ),
                    hintText: 'Blood Bank',
                    suffixIcon: Icon(
                      Icons.search,
                      size: 25,
                    )),
              ),
            ),
           const  SizedBox(
              height: 22,
            ),
            buildcard(
                image: 'assets/images/blood1.png',
                bloodBank: ' NRCS Blood Bank',
                bloodGroup: ' BLood Group A+',
                phoneNumber: '01-6611661, 01-6612266',
                location: "Bhaktapur"),
            buildcard(
                image: 'assets/images/blood6.png',
                bloodBank: '  NRCS Blood Bank,',
                bloodGroup: ' BLood Group A+',
                phoneNumber: '01- 4288485',
                location: "Soaltee-Mode"),
            buildcard(
                image: 'assets/images/blood3.png',
                bloodBank: '  NRCS Blood Bank,',
                bloodGroup: ' BLood Group A+',
                phoneNumber: '+97715427033',
                location: "Pulchowk"),
            buildcard(
                image: 'assets/images/blood4.png',
                bloodBank: '  Nobel Hospital',
                bloodGroup: ' BLood Group A+',
                phoneNumber: '01-4110842',
                location: "Sinamangal"),
            buildcard(
                image: 'assets/images/blood5.png',
                bloodBank: ' Gangalal Hospital',
                bloodGroup: ' BLood Group A+',
                phoneNumber: '01-4371322',
                location: "Bansbari"),
            // ignore: deprecated_member_use
            RaisedButton(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.amber,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SinglePage()));
                },
                child: const Text("API",style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 30,color:Colors.black),),),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Padding buildcard({image, bloodBank, bloodGroup, phoneNumber, location}) {
    void opengmail() async {
      String email = "ksoorajkarki@gmail.com";
      var urlmail = "mailto:$email";
      if (await canLaunch(urlmail)) {
        await launch(urlmail);
      } else {
         // ignore: avoid_print
         print('error');
        throw 'Error occured';
      }
    }

    void opencall() async {
      String call = phoneNumber;
      var urlcall = "tel://:$call";
      if (await canLaunch(urlcall)) {
        await launch(urlcall);
      } else {
         // ignore: avoid_print
        print('error');
        throw 'Error occured';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 25, 190, 30),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Image(
                    image: AssetImage(image),
                    width: 60,
                    height: 60,
                  ),
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                bloodBank,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 6, 46, 26)),
              ),
              Text(bloodGroup),
              Text(phoneNumber),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                opencall();
              },
              icon: const Icon(
                Icons.phone,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () {
                opengmail();
              },
              icon: const Icon(Icons.message, color: Colors.green)),
        ],
      )),
    );
  }
}
