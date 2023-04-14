import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BmiApp(),
  ));
}

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double H = 150.0;
  int W = 50, A = 20;
  bool isMale = true, englich = true;
  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }
    return input;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.translate),
            onPressed: (){
            setState(() {
              englich=!englich;
            });
          }, ),
          centerTitle: true,
          backgroundColor: Colors.black87,
          title: Text(englich?"BMI Calculator":"حساب كتلة الجسم")),
      body: Container(
        color: Colors.black87,
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              isMale ? Colors.pinkAccent[400] : Colors.black38,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage("images/male.png"),
                              color: Colors.white,
                              width: 50,
                              height: 50),
                          SizedBox(
                            height: 10,
                          ),
                          Text(englich?"Male":"ذكر",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              !isMale ? Colors.pinkAccent[400] : Colors.black38,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/female.png"),
                            color: Colors.white,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(englich?"Female":"انثي",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(englich?"HEIGHT":"طول",
                          style:
                              TextStyle(fontSize: 20, color: Colors.white30)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              englich?"${H.round()}":"${replaceFarsiNumber(H.round().toString())}",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(englich?"cm":"سم",
                                  style: TextStyle(color: Colors.white30)),
                            ),
                          ]),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Slider(
                            activeColor: Colors.pinkAccent[400],
                            onChanged: (s) {
                              setState(() {
                                H = s;
                              });
                            },
                            value: H,
                            max: 220,
                            min: 80),
                      ),
                    ]),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(englich?"WEIGHT":"وزن",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white30)),
                        Text(englich?"$W":"${replaceFarsiNumber(W.toString())}",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (W < 600) W++;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.white),
                                  backgroundColor: Colors.grey[800]),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (W > 10) W--;
                                    });
                                  },
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
                                  backgroundColor: Colors.grey[800]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(englich?"Age":"السن",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white30)),
                        Text(englich?"$A":"${replaceFarsiNumber(A.toString())}",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (A < 100) A++;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.white),
                                  backgroundColor: Colors.grey[800]),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (A > 1) A--;
                                    });
                                  },
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
                                  backgroundColor: Colors.grey[800]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: MaterialButton(
                child: Text(englich?"Calculate":"احسب",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                color: Colors.pinkAccent[400],
                onPressed: () {double G = H/100;
                  double bmi = (W)/(G*G);String s;
                if(bmi<18.5) s = englich?"Underweight":"نحيف";
                else if (bmi<25.99 && bmi>18.5) s = englich?"Normal Weight":"طبيعية";
                else if(bmi>25.99 && bmi<30.01) s = englich?"Overweight":"وزن زائد";
                else  s = englich?"Obese":"سمين";
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          contentPadding: EdgeInsets.all(0.0),
                          content: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            width: 300.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(height: 40,
                                    child: Text(
                                     englich?"BMI Calculator":"حساب كتلة الجسم",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  color: Colors.pinkAccent,
                                  height: 4.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(30.0),
                                  child: Text(textDirection: englich?TextDirection.ltr:TextDirection.rtl,
                                    englich?"BMI : $s":"كتلة الجسم :  $s",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    decoration: BoxDecoration(
                                      color: Colors.pinkAccent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(32.0),
                                          bottomRight: Radius.circular(32.0)),
                                    ),
                                    child: Text(
                                      "OK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onTap: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ]),
      ),
    );
  }
}
