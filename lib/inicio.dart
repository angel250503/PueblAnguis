import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Inicio(),
  ));
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          _buildMenuItem(
            context,
            Icons.info,
            'Sobre nosotros',
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          _buildMenuItem(
            context,
            Icons.settings,
            'Configuración',
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          _buildMenuItem(
            context,
            Icons.help,
            'Ayuda',
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        onTap();
      },
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre nosotros'),
      ),
      body: Center(
        child: Text('Esta es la página "Sobre nosotros".'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Text('Esta es la página de "Configuración".'),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: Center(
        child: Text('Esta es la página de "Ayuda".'),
      ),
    );
  }
}
