import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:garaksheetapi/meal_order_api.dart'; // UserSheetsApi 클래스가 정의된 파일을 임포트합니다.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheets API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Google Sheets API Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Map<String, dynamic>>> _cellValues;

  @override
  void initState() {
    super.initState();
    _cellValues = _fetchCellValues();
  }

Future<List<Map<String, dynamic>>> _fetchCellValues() async {
  final a1 = await UserSheetsApi.userSheet!.values.value(column: 1, row: 1);
  final b1 = await UserSheetsApi.userSheet!.values.value(column: 2, row: 1);
  final c1 = await UserSheetsApi.userSheet!.values.value(column: 3, row: 1);
  final d1 = await UserSheetsApi.userSheet!.values.value(column: 4, row: 1);

  return [{'A': a1, 'B': b1, 'C': c1, 'D':d1}];
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _cellValues,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final cellValue = snapshot.data![index];
                return ListTile(
                  title: Text('Row ${index + 1}'),
                  subtitle: Text('A: ${cellValue['A']}, B: ${cellValue['B']}, C: ${cellValue['C']}, D: ${cellValue['D']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
