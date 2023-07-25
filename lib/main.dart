import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/Pay.dart';
import 'screens/CreateAccount.dart';
import 'screens/UpdatePasss.dart';
import 'screens/login.dart';
import 'screens/unRememberPass.dart';
import 'screens/home.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); // đặt màn hình ngang
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',

      // home: AddQuestion(),
      routes: {
        'login': (context) => const login_screen(),
        'home': (context) => const home(),
        'unRemmemberPass': (context) => const unRememberPass(),
        'UpdatePasss': (context) => const UpdatePasss(),
        'CreateAccount': (context) => const CreateAccount(),
        'Pay': (context) => const Pay(),
      },
    );
  }
}

// class AddQuestion extends StatefulWidget {
//   const AddQuestion({super.key});

//   @override
//   State<AddQuestion> createState() => _AddQuestionState();
// }

// class _AddQuestionState extends State<AddQuestion> {
//   final _fireStore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//           onPressed: () {
//             _fireStore.collection("Questions").add({
//               'Id': 120,
//               'Title': "Tên gọi Tân Việt Cách mạng đảng có từ khi nào?",
//               'Answer': ["Năm 1922", "Năm 1922", "Năm 1928", "Năm 1929"],
//               'Key': 2,
//               'Point': 150,
//               'Subject': {'Id': 5, 'Title': "Lịch sử"},
//               'Chapter': {'Id': 3, 'Title': "Về đích"}
//             }).then((value) {
//               final snackBar = SnackBar(content: Text("Thêm thành công"));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             }).onError((error, stackTrace) {
//               final snackBar = SnackBar(content: Text("Có Lỗi Xảy Ra"));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             });
//           },
//           child: Text("Nhấn vào")),
//     ));
//   }
// }
