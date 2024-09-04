import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home:  MyHomePage(title: 'BMI Calculate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var ft_Controller = TextEditingController();
 var wt_Controller = TextEditingController();
 var in_Controller = TextEditingController();
 var result= "";
 var bgcolor = Colors.blueGrey.shade50;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.grey.shade300,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
         color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // heading of app
                Text("BMI", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                SizedBox(height: 15,),

                TextField(
                  controller: wt_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter the Weight (in Kg)"),
                    suffixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    // enable border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: ft_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter the height (in Feet)"),
                    suffixIcon: Icon(
                      Icons.height,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    // enable border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: in_Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter the height (in inch)"),
                    suffixIcon: Icon(
                      Icons.height,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    // enable border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                ElevatedButton(onPressed: (){
                  //BMI Calculation
                  var Wt = wt_Controller.text.toString();
                 var Ft = ft_Controller.text.toString();
                 var In = in_Controller.text.toString();

                 if (Wt !="" && Ft !="" && In !=""){
                    var iWt = int.parse(Wt);
                    var iFt = int.parse(Ft);
                    var iIn = int.parse(In);

                    var tIn = (iFt*12) + iIn;
                    var tCm = tIn * 2.54;
                    var tM = tCm/100;

                    var bmi = iWt/(tM * tM);

                    var msg ="";

                    if(bmi>25){
                      msg="you are Overweight... ";
                      bgcolor= Colors.orangeAccent.shade100;
                    }else if(bmi<18){
                      msg="you are Underweight... ";
                      bgcolor= Colors.redAccent.shade100;
                    } else{
                      msg="you are healthy... ";
                      bgcolor= Colors.greenAccent.shade100;
                    }

                    setState(() {
                      result = " $msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });

                 }else{
                   setState(() {
                     bgcolor= Colors.blueGrey.shade50;
                     result = "Some  field are missed.. Check again!";
                   });
                 }

                },
                  child: Text(
                    "calculate",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
                SizedBox(height: 15,),
                Text(result, style: TextStyle(fontSize: 17, color: Colors.black ),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
