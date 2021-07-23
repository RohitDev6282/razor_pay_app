import 'package:flutter/material.dart';

class DeleteFile extends StatefulWidget {
  final drink;

  const DeleteFile({required Key key, @required this.drink}) : super(key: key);

  @override
  _DeleteFileState createState() => _DeleteFileState();
}

class _DeleteFileState extends State<DeleteFile> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.drink["strDrink"]),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Employee ID: ${widget.drink["idDrink"]}",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Card(
                      child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Name: ${widget.drink["strDrink"]}",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  )),
                  Card(
                      child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Contact no.934343232",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    widget.drink["strDrinkThumb"],
                  ),
                ),
              )
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Address:- Sector 35,Noida, U.P-201301",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Toady Date: ",
                            style: TextStyle(
                                fontSize: 18, color: Colors.green[400]),
                          ),
                        ),
                        Container(
                          child: new Text(
                            '${_date.toString()}',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
         
          // Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: Container(
          //     child: Column(
          //       children: [
          //         RaisedButton(
          //           color: Colors.red,
          //           onPressed: () {
          //             Navigator.push(context,
          //                 new MaterialPageRoute(builder: (context) => Home()));
          //           },
          //           child: Text(
          //             "Clock In",
          //             style: TextStyle(color: Colors.white, fontSize: 20),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    
    );
  }
}