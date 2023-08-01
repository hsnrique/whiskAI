import 'package:flutter/material.dart';

class SugestoesScreen extends StatelessWidget {
  final String pesquisaResult;
  final List<String> sugestoesWhiskey;
  final String textoResult;

  const SugestoesScreen({super.key,
    required this.pesquisaResult,
    required this.sugestoesWhiskey,
    required this.textoResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sugestões de Whiskey',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Chelsea',
          ),
        ),
        titleSpacing: 10,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Texto Retornado pelo OpenAI:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                textoResult,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sugestões de Whiskey:', // Título para mostrar as sugestões de whiskey
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Aqui você pode adicionar a lista de sugestões de whiskey, por exemplo:
              ListView.builder(
                shrinkWrap: true,
                itemCount: sugestoesWhiskey.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sugestoesWhiskey[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
