import 'package:flutter/material.dart';

import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
        '/': (context) => new Loading(),
        '/home': (context) => new Home(),
        '/location': (context) => new ChooseLocation()
    },
));