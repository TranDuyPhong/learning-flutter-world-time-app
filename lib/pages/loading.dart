import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
    @override
    _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
    void getWorldTime() async {
        // WorldTime worldTime = new WorldTime(location: 'Salta', flag: 'argentina.png', time: '', url: 'America/Argentina/Salta');
        // await worldTime.getTime();
        Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, '/home', arguments: {
                'location': 'Việt Nam',
                'flag': 'vietnam.png',
                'time': '2020-01-28 15:33:30',
                'isDayTime': false
            });
        });
    }

    @override
    void initState() {
        super.initState();
        getWorldTime();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            backgroundColor: Colors.blue[900],
            body: new Center(
                child: new SpinKitRipple(
                    color: Colors.white,
                    size: 50.0,
                ),
            ),
        );
    }
}
