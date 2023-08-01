import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whiskey_ai/api/api_service.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'historico_busca_screen.dart'; // Importe a página HistoricoBuscasScreen

class PesquisaScreen extends StatefulWidget {
  const PesquisaScreen({Key? key, required Null Function(dynamic result) onPesquisaResult})
      : super(key: key);

  @override
  State<PesquisaScreen> createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {
  TextEditingController userInputTextEditingController = TextEditingController();
  final SpeechToText speechToTextInstance = SpeechToText();
  String recordedAudioString = "";
  bool isLoading = false;
  bool speakFRIDAY = true;
  String modeOpenAI = "chat";
  String answerTextFromOpenAI = "";
  final FlutterTts textToSpeechInstance = FlutterTts();

  void initializeSpeechToText() async {
    await speechToTextInstance.initialize();
    setState(() {});
  }

  void startListeningNow() async {
    FocusScope.of(context).unfocus();
    await speechToTextInstance.listen(onResult: onSpeechToTextResult);
    setState(() {});
  }

  void stopListeningNow() async {
    await speechToTextInstance.stop();
    setState(() {});
  }

  void onSpeechToTextResult(SpeechRecognitionResult recognitionResult) {
    recordedAudioString = recognitionResult.recognizedWords;
    speechToTextInstance.isListening ? null : sendRequestToOpenAI(recordedAudioString);
    if (kDebugMode) {
      print("Speech Result:");
    }
    if (kDebugMode) {
      print(recordedAudioString);
    }
  }

  Future<void> sendRequestToOpenAI(String userInput) async {
    stopListeningNow();
    setState(() {
      isLoading = true;
    });

    // send the request to openAI using our APIService
    await APIService().requestOpenAI(userInput, modeOpenAI, 2000).then((value) {
      setState(() {
        isLoading = false;
      });

      if (value.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Api Key you are/were using expired or it is not working anymore.",
            ),
          ),
        );
      }

      userInputTextEditingController.clear();
      final responseAvailable = jsonDecode(value.body);

      if (modeOpenAI == "chat") {
        setState(() {
          answerTextFromOpenAI = utf8.decode(responseAvailable["choices"][0]["text"].toString().codeUnits);
          if (kDebugMode) {
            print("ChatGPT Chatbot: ");
          }
          if (kDebugMode) {
            print(answerTextFromOpenAI);
          }
        });

        if (speakFRIDAY == true) {
          textToSpeechInstance.speak(answerTextFromOpenAI);
        }
      }
    }).catchError((errorMessage) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: $errorMessage",
          ),
        ),
      );
    });
  }

  void _salvarBuscaNoHistorico(String pesquisa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historicoBuscas = prefs.getStringList('historico_buscas') ?? [];
    if (!historicoBuscas.contains(pesquisa)) {
      historicoBuscas.add(pesquisa);
      prefs.setStringList('historico_buscas', historicoBuscas);
    }
  }

  void _abrirHistoricoBuscas() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HistoricoBuscasScreen(), // Abre a página do histórico
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Título da tela de Pesquisa
                  const Text(
                    'Pesquise pelo seu Whiskey:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Text field para pesquisa
                  TextField(
                    controller: userInputTextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite aqui...',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botão para enviar pesquisa
                  ElevatedButton(
                    onPressed: () {
                      if (userInputTextEditingController.text.isNotEmpty) {
                        sendRequestToOpenAI(userInputTextEditingController.text.toString());
                        _salvarBuscaNoHistorico(userInputTextEditingController.text.toString());
                      }
                    },
                    child: const Text('Pesquisar'),
                  ),

                  const SizedBox(height: 40),

                  // Resposta do chat GPT
                  isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                    answerTextFromOpenAI,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[900],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _abrirHistoricoBuscas,
                child: const Text('Ver histórico'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
