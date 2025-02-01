import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Região Sul do Brasil',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Região Sul do Brasil')),
      drawer: MediaQuery.of(context).size.width < 600 ? DrawerMenu() : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 600) ...[
            SizedBox(width: 250, child: DrawerMenu()),
          ],
          Expanded(
            child: Center(
              child: Text(
                'Bem-vindo à Região Sul do Brasil!',
                style: TextStyle(fontSize: 24, color: Colors.green[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Estados'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.nature_people),
            title: const Text('Cultura'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.landscape),
            title: const Text('Turismo'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
