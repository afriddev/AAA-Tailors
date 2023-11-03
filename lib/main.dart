import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/mainScreenNavigator.dart';
import 'state/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences p = await
  SharedPreferences.getInstance();




  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (_) => stateProvider(),
    child: mainScreenNavigator(),
  ));
}
