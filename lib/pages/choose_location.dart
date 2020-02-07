import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
    @override
    _ChooseLocationState createState() => new _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
    List<WorldTime> worldTimes = [
        new WorldTime(location: 'Campodia', url: 'Campodia', time: '', flag: 'cambodia.png'),
        new WorldTime(location: 'Canada', url: 'Canada', time: '', flag: 'canada.png'),
        new WorldTime(location: 'China', url: 'China', time: '', flag: 'china.png'),
        new WorldTime(location: 'Iran', url: 'Iran', time: '', flag: 'iran.png'),
        new WorldTime(location: 'Iraq', url: 'Iraq', time: '', flag: 'iraq.png'),
        new WorldTime(location: 'Israel', url: 'Israel', time: '', flag: 'israel.png'),
        new WorldTime(location: 'Japan', url: 'Japan', time: '', flag: 'japan.png'),
        new WorldTime(location: 'South-Korea', url: 'South-Korea', time: '', flag: 'south-korea.png'),
        new WorldTime(location: 'Việt Nam', url: 'VietNam', time: '', flag: 'vietnam.png')
    ];

    void updateTime(index) async {
        WorldTime worldTime = worldTimes[index];
        Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context, {
                'location': worldTime.location,
                'flag': worldTime.flag,
                'time': '2020-01-28 17:30:12',
                'isDayTime': true
            });
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('ChooseLocation Screen'),
                centerTitle: true,
                backgroundColor: Colors.blue[900],
                elevation: 0.0,
            ),
            body: new ListView.builder(
                itemCount: worldTimes.length,
                itemBuilder: (context, index) {
                    return new Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                        child: new Card(
                            child: new ListTile(
                                onTap: () {
                                    updateTime(index);
                                },
                                leading: new CircleAvatar(
                                    backgroundImage: new AssetImage('assets/${worldTimes[index].flag}'),
                                ),
                                title: new Text(
                                    worldTimes[index].location
                                ),
                            ),
                        ),
                    );
                }
            )
        );
    }
}
