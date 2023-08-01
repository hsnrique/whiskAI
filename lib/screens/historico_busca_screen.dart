import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricoBuscasScreen extends StatefulWidget {
  const HistoricoBuscasScreen({super.key});

  @override
  State<HistoricoBuscasScreen> createState() => _HistoricoBuscasScreenState();
}

class _HistoricoBuscasScreenState extends State<HistoricoBuscasScreen> {
  final List<String> historicoBuscas = []; // Lista de histórico de buscas
  final Map<String, String> respostaDoOpenAI =
      {}; // Mapa para armazenar as respostas do OpenAI para cada busca

  @override
  void initState() {
    super.initState();
    _carregarHistoricoBuscas();
  }

  // Carrega as buscas salvas no shared_preferences
  _carregarHistoricoBuscas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> buscasSalvas = prefs.getStringList('historico_buscas') ?? [];
    setState(() {
      historicoBuscas.addAll(buscasSalvas);
    });
  }

  // Limpa uma busca específica do histórico
  _limparBusca(String pesquisa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    historicoBuscas.remove(pesquisa);
    prefs.setStringList('historico_buscas', historicoBuscas);
    setState(() {});
  }

  // Limpa todas as buscas do histórico
  _limparTodasAsBuscas() async {
    // Exibir o diálogo de confirmação
    bool confirmacao = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar todas as buscas?'),
        content: const Text(
            'Esta ação irá apagar todas as buscas do histórico. Deseja continuar?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Retorna true para confirmar
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Retorna false para cancelar
            },
            child: const Text('Não'),
          ),
        ],
      ),
    );

    // Se a confirmação for verdadeira, limpa todas as buscas
    if (confirmacao == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      historicoBuscas.clear();
      prefs.setStringList('historico_buscas', []);
      setState(() {});
    }
  }

  // Refaz a pesquisa quando um item do histórico é selecionado
  _refazerPesquisa(String pesquisa) {
    // Simule uma requisição ao OpenAI para obter a resposta
    // Substitua esse trecho pelo código que realiza a requisição de verdade
    String resposta = 'Resposta do OpenAI para: $pesquisa';
    respostaDoOpenAI[pesquisa] = resposta;

    // Navega para a tela de SugestoesScreen com a resposta do OpenAI
    Navigator.pop(context, respostaDoOpenAI[pesquisa]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Histórico de Buscas',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Chelsea',
          ),
        ),
        titleSpacing: 10,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: historicoBuscas.length,
        itemBuilder: (context, index) {
          final pesquisa = historicoBuscas[index];
          return ListTile(
            title: Text(pesquisa),
            onTap: () {
              _refazerPesquisa(pesquisa);
            },
            trailing: IconButton(
              onPressed: () {
                _limparBusca(pesquisa);
              },
              icon: const Icon(Icons.clear),
              tooltip: 'Limpar busca',
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20), // Espaçamento inferior do botão
        child: ElevatedButton(
          onPressed: () {
            _limparTodasAsBuscas();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red, // Define a cor do botão
          ),
          child: const Text(
            'Limpar tudo',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
