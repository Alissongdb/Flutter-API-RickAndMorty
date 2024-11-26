import 'package:flutter/material.dart';

class EscolhaView extends StatefulWidget {
  const EscolhaView({super.key});

  @override
  State<EscolhaView> createState() => _EscolhaViewState();
}

class _EscolhaViewState extends State<EscolhaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2BE2),
              Color(0xFF6495ED),
              Color(0xFFD8BFD8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/episodios');
                },
                child: const Text(
                  '   Episodios   ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/localizacao');
                },
                child: const Text(
                  ' Localizacao ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/personagens');
                },
                child: const Text(
                  'Personagens',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
