import 'package:flutter/material.dart';

class GuiaScreen extends StatelessWidget {
  const GuiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Guia de Degustação de Whiskey:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '1. Observação Visual:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Segure o copo de whiskey contra a luz para avaliar sua cor e viscosidade. Observe a tonalidade do líquido e a formação de "lágrimas" na parede do copo quando você o inclina. A cor e a textura podem fornecer pistas sobre o envelhecimento e a qualidade do whiskey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '2. Avaliação Olfativa:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Aproxime o copo do seu nariz e inspire lentamente. Observe os aromas que surgem do whiskey. Procure por notas de frutas, especiarias, baunilha, caramelo, entre outros. Os aromas podem variar dependendo do tipo de whiskey e do processo de envelhecimento.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '3. Degustação:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Dê um pequeno gole no whiskey e deixe-o circular em sua boca. Observe as sensações e sabores que você experimenta. Preste atenção aos sabores iniciais, meios e finais. Note se o whiskey é suave, picante, doce ou amargo. Aprecie a complexidade e as camadas de sabores que o whiskey pode oferecer.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '4. Finalização:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Após degustar o whiskey, observe a sensação que ele deixa em sua boca. Alguns whiskeys têm um final longo e persistente, enquanto outros podem ser mais suaves e desaparecer rapidamente. A finalização é a impressão que o whiskey deixa após a degustação.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '5. Combinações:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Experimente combinar diferentes tipos de whiskey com alimentos para descobrir harmonizações interessantes. Whiskeys mais suaves e adocicados podem ser apreciados com sobremesas, enquanto os mais intensos combinam bem com queijos e carnes defumadas. Explore as possibilidades de combinações para aprimorar sua experiência de degustação.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '6. Água e Gelo:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Alguns entusiastas de whiskey preferem degustar a bebida pura, enquanto outros adicionam algumas gotas de água ou gelo ao copo. A adição de água pode liberar aromas e sabores adicionais, enquanto o gelo pode suavizar o whiskey e torná-lo mais refrescante. Experimente diferentes abordagens para descobrir sua preferência pessoal.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '7. Armazenamento:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Mantenha suas garrafas de whiskey em posição vertical e evite a exposição à luz solar direta e variações extremas de temperatura. Armazene o whiskey em local fresco e seco para preservar suas características de sabor e qualidade ao longo do tempo.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '8. Diversidade de Tipos:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Explore a ampla diversidade de whiskey disponível, incluindo bourbon, scotch, rye, irish whiskey e outras variedades. Cada tipo tem suas próprias características distintas e histórias únicas. Aventure-se a conhecer diferentes estilos e marcas para enriquecer seu paladar e conhecimento sobre a bebida.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '9. Beba com Moderação:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'O whiskey é uma bebida alcoólica e deve ser apreciado com responsabilidade. Beba com moderação e saiba os limites do seu consumo. Se você for dirigir ou realizar atividades que exijam concentração, evite o consumo de bebidas alcoólicas. Cuide de sua saúde e bem-estar enquanto desfruta da experiência de degustação de whiskey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              // Continue adicionando mais informações ao guia de degustação do whiskey
            ],
          ),
        ),
      ),
    );
  }
}

