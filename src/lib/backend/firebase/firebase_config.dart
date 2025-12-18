import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCDK6au07tidlVKjeHysXqpiC08Z9djhG0",
            authDomain: "eventure-c3558.firebaseapp.com",
            projectId: "eventure-c3558",
            storageBucket: "eventure-c3558.firebasestorage.app",
            messagingSenderId: "662828811981",
            appId: "1:662828811981:web:b29ec8f129fab06f7ecb84",
            measurementId: "G-EV6W6Q4N0X"));
  } else {
    await Firebase.initializeApp();
  }
}
