import 'package:flutter/material.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
    Map data = {};

    @override
    Widget build(BuildContext context) {
        data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

        String backgroundImage = data['isDayTime'] ? 'day.png' : 'night.png';
        Color backgroundColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

        return new Scaffold(
            backgroundColor: backgroundColor,
            body: new SafeArea(
                child: new Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage('assets/$backgroundImage'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: new Padding(
                        padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
                        child: new Column(
                            children: <Widget>[
                                new FlatButton.icon(
                                    onPressed: () async {
                                        dynamic result = await Navigator.pushNamed(context, '/location');
                                        setState(() {
                                            this.data = {
                                                'time': result['time'],
                                                'location': result['location'],
                                                'isDayTime': result['isDayTime'],
                                                'flag': result['flag']
,                                           };
                                        });
                                    },
                                    icon: new Icon(
                                        Icons.edit_location,
                                        color: Colors.grey[300],
                                    ),
                                    label: new Text(
                                        'Edit Location',
                                        style: new TextStyle(
                                            color: Colors.grey[300]
                                        ),
                                    )
                                ),
                                new SizedBox(
                                    height: 20.0,
                                ),
                                new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        new Text(
                                            data['location'],
                                            style: new TextStyle(
                                                fontSize: 28.0,
                                                letterSpacing: 2.0,
                                                color: Colors.white
                                            ),
                                        )
                                    ],
                                ),
                                new SizedBox(
                                    height: 20.0,
                                ),
                                new Text(
                                    data['time'],
                                    style: new TextStyle(
                                        fontSize: 40.0,
                                        color: Colors.white
                                    )
                                )
                            ],
                        ),
                    )
                )
            ),
        );
    }
}
