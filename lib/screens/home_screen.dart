import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'whiskey_data.dart';
import 'pesquisa_screen.dart';
import 'guia_screen.dart';
import 'curiosidades_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum TabType { whiskeySuggestion, whiskeyGuide, whiskeyCuriosities }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final FlutterTts textToSpeechInstance = FlutterTts();
  TabController? _tabController;
  String pesquisaResult = "";
  List<WhiskeyData> sugestoesWhiskey = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController!.addListener(() {
      setState(() {
        switch (_tabController!.index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.brown,
              Colors.brown,
            ]),
          ),
        ),
        title: const Text(
          'WhiskAI',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Chelsea',
          ),
        ),
        titleSpacing: 10,
        elevation: 2,
        bottom: TabBar(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.auto_awesome),
              text: 'Sugestões',
            ),
            Tab(
              icon: Icon(Icons.article),
              text: 'Guia',
            ),
            Tab(
              icon: Icon(Icons.lightbulb),
              text: 'Curiosidades',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Aba de Sugestões de Whiskey
          PesquisaScreen(
            onPesquisaResult: (result) {
              setState(() {
                pesquisaResult = result;
              });
            },
          ),
          // Aba de Guia de Degustação de Whiskey
          const GuiaScreen(),
          // Aba de Curiosidades sobre Whiskey
          const CuriosidadesScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          textToSpeechInstance.stop();
        },
        child: const Icon(
          Icons.volume_off,
          color: Colors.grey,
          size: 35,
        ),
      ),
    );
  }
}
