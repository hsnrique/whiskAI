import 'package:flutter/material.dart';
import 'dart:math';

class CuriosidadesScreen extends StatefulWidget {
  const CuriosidadesScreen({super.key});

  @override
  State<CuriosidadesScreen> createState() => _CuriosidadesScreenState();
}

class _CuriosidadesScreenState extends State<CuriosidadesScreen> {
  // Lista de curiosidades sobre whiskey
  final List<String> curiosidadesList = [
    'O whiskey, também conhecido como uísque, é uma bebida destilada feita a partir de grãos fermentados, incluindo cevada, milho, centeio e trigo. É um dos destilados mais populares e apreciados em todo o mundo. A palavra "whiskey" tem origem no gaélico escocês "uisge beatha" e no gaélico irlandês "uisce beatha", que significam "água da vida". Essa bebida alcoólica tem uma rica história que remonta a séculos atrás. Existem diferentes tipos de whiskey, cada um com suas próprias características distintas. Alguns dos tipos mais conhecidos incluem bourbon, scotch, rye e irish whiskey. O processo de produção do whiskey é complexo e envolve várias etapas, incluindo fermentação, destilação e envelhecimento em barris de carvalho. O whiskey pode ser envelhecido por vários anos em barris de carvalho, o que confere à bebida sabores e aromas únicos. Quanto mais tempo o whiskey é envelhecido, mais suave e complexo ele se torna.',

    'O bourbon é um tipo de whiskey americano que é produzido principalmente a partir de milho. Ele recebe esse nome devido à região de Bourbon County, no estado do Kentucky, onde o whiskey bourbon foi originalmente produzido. O scotch é um tipo de whiskey escocês que é conhecido por seu sabor defumado e característico. É feito principalmente a partir de cevada maltada e é destilado duas vezes. O whiskey irlandês é geralmente destilado três vezes, o que lhe confere uma textura mais suave e delicada em comparação com outros tipos de whiskey. A destilação do whiskey é um processo delicado que envolve aquecimento da mistura fermentada para separar os componentes alcoólicos dos não alcoólicos. O whiskey é envelhecido em barris de carvalho, que são responsáveis por dar à bebida suas características de sabor e cor.',

    'Os barris de carvalho usados para envelhecer o whiskey podem ser queimados por dentro para intensificar os sabores que serão transmitidos à bebida. Durante o processo de envelhecimento do whiskey, uma parte da bebida evapora, criando o que é conhecido como "a parte dos anjos". O whiskey é conhecido por seu teor alcoólico relativamente alto, que geralmente varia de 40% a 50% ABV (álcool por volume). Existem muitos mitos e lendas associados ao whiskey, incluindo histórias sobre destiladores clandestinos e contrabandistas. O whiskey é frequentemente associado à cultura do Velho Oeste nos Estados Unidos, onde era consumido por cowboys e fora da lei.',

    'O whiskey é uma bebida versátil e pode ser apreciado puro, com gelo, em coquetéis ou mesmo usado como ingrediente em pratos de culinária. O famoso coquetel Manhattan é feito com whiskey, vermute doce e gotas de angostura, servido com uma cereja como enfeite. Outro coquetel clássico que leva whiskey é o Old Fashioned, que é preparado com açúcar, angostura, água com gás e uma casca de laranja ou cereja como guarnição. O whiskey também é usado em muitas receitas de sobremesas, como bolos, tortas e sorvetes. Além de ser apreciado em sua forma pura, o whiskey pode ser combinado com refrigerante de cola para criar a popular bebida conhecida como "whiskey cola".',

    'A idade do whiskey é um fator importante que afeta seu sabor e valor. Whiskeys mais antigos tendem a ser mais suaves e complexos. O whiskey é uma bebida que pode ser apreciada em todas as estações do ano, seja no calor do verão ou no frio do inverno. O famoso escritor Mark Twain era conhecido por ser um grande apreciador de whiskey. O whiskey é uma bebida popular em celebrações e ocasiões especiais, como casamentos e festas. O whiskey é produzido em muitos países ao redor do mundo, incluindo Estados Unidos, Escócia, Irlanda, Canadá e Japão. O whiskey é uma bebida que pode ser apreciada por pessoas de diferentes gostos e preferências. Alguns entusiastas de whiskey acreditam que a adição de algumas gotas de água à bebida pode abrir os sabores e aromas.',

    'O whiskey foi uma das primeiras bebidas alcoólicas destiladas a serem produzidas no mundo. A produção de whiskey é um processo que requer muita paciência e habilidade, pois a bebida precisa ser cuidadosamente monitorada durante todo o processo de envelhecimento. O whiskey escocês é frequentemente associado ao termo "single malt", que se refere a um whiskey produzido em uma única destilaria usando apenas cevada maltada. Outro termo comum usado para descrever o whiskey escocês é "blended", que se refere a um whiskey feito a partir da mistura de diferentes destilados. O whiskey irlandês é geralmente conhecido por sua suavidade e notas de sabor de frutas.',

    'O whiskey americano é frequentemente envelhecido em barris de carvalho novos e carbonizados, o que lhe confere sabores de baunilha e caramelo. O whiskey bourbon é obrigado por lei a ser envelhecido em barris de carvalho novos e carbonizados. O Japão é conhecido por produzir whiskeys de alta qualidade, muitos dos quais são inspirados nos métodos de produção escoceses. A bebida conhecida como "moonshine" é um tipo de whiskey caseiro que é destilado clandestinamente. A destilação do whiskey requer cuidadosa atenção à temperatura e aos tempos de destilação para obter os sabores desejados. Os destiladores de whiskey são frequentemente considerados artesãos, dedicando suas vidas à busca da perfeição na produção da bebida.',

    'A cor do whiskey é influenciada pelo envelhecimento em barris de carvalho, bem como pelos grãos e métodos de destilação utilizados. O whiskey é frequentemente associado a rituais de degustação elaborados, com entusiastas apreciando a bebida em copos especiais e seguindo etapas específicas de análise sensorial. O whiskey é uma bebida que pode ser apreciada sozinha, em um momento de contemplação e relaxamento. Muitas destilarias de whiskey têm visitas guiadas e oferecem aos visitantes a oportunidade de conhecer o processo de produção da bebida. O whiskey é frequentemente usado em medicina alternativa, com algumas pessoas acreditando que ele possui propriedades curativas.',

    'O whiskey é uma bebida que evolui com o tempo, desenvolvendo sabores mais complexos à medida que envelhece. O whiskey é uma bebida que tem sido associada a celebrações, rituais religiosos e até mesmo a superstições. O whiskey é uma bebida alcoólica que deve ser apreciada com moderação, pois o consumo excessivo pode ter efeitos negativos na saúde. A indústria do whiskey tem uma rica história e desempenhou um papel importante na economia de muitos países. O whiskey é frequentemente associado a figuras históricas importantes, com muitos líderes políticos e celebridades apreciando a bebida ao longo da história. O whiskey é uma bebida que transcende fronteiras culturais e é apreciada por pessoas de todas as idades e origens.',

    'O whiskey é uma bebida clássica que nunca sai de moda, continuando a ser uma das bebidas destiladas mais populares e amadas em todo o mundo. Os barris de carvalho usados para envelhecer o whiskey podem ser queimados por dentro para intensificar os sabores que serão transmitidos à bebida. Durante o processo de envelhecimento do whiskey, uma parte da bebida evapora, criando o que é conhecido como "a parte dos anjos". O whiskey é conhecido por seu teor alcoólico relativamente alto, que geralmente varia de 40% a 50% ABV (álcool por volume). Existem muitos mitos e lendas associados ao whiskey, incluindo histórias sobre destiladores clandestinos e contrabandistas.',

    'O whiskey é frequentemente associado à cultura do Velho Oeste nos Estados Unidos, onde era consumido por cowboys e fora da lei. A idade do whiskey é um fator importante que afeta seu sabor e valor. Whiskeys mais antigos tendem a ser mais suaves e complexos. O whiskey é uma bebida que pode ser apreciada em todas as estações do ano, seja no calor do verão ou no frio do inverno. O famoso escritor Mark Twain era conhecido por ser um grande apreciador de whiskey. O whiskey é uma bebida popular em celebrações e ocasiões especiais, como casamentos e festas.',

    'O whiskey é produzido em muitos países ao redor do mundo, incluindo Estados Unidos, Escócia, Irlanda, Canadá e Japão. O whiskey é uma bebida que pode ser apreciada por pessoas de diferentes gostos e preferências. Alguns entusiastas de whiskey acreditam que a adição de algumas gotas de água à bebida pode abrir os sabores e aromas. O whiskey foi uma das primeiras bebidas alcoólicas destiladas a serem produzidas no mundo. A produção de whiskey é um processo que requer muita paciência e habilidade, pois a bebida precisa ser cuidadosamente monitorada durante todo o processo de envelhecimento.',

    'O whiskey escocês é frequentemente associado ao termo "single malt", que se refere a um whiskey produzido em uma única destilaria usando apenas cevada maltada. Outro termo comum usado para descrever o whiskey escocês é "blended", que se refere a um whiskey feito a partir da mistura de diferentes destilados. O whiskey irlandês é geralmente conhecido por sua suavidade e notas de sabor de frutas. O whiskey americano é frequentemente envelhecido em barris de carvalho novos e carbonizados, o que lhe confere sabores de baunilha e caramelo. O Japão é conhecido por produzir whiskeys de alta qualidade, muitos dos quais são inspirados nos métodos de produção escoceses.',

    'A bebida conhecida como "moonshine" é um tipo de whiskey caseiro que é destilado clandestinamente. A destilação do whiskey requer cuidadosa atenção à temperatura e aos tempos de destilação para obter os sabores desejados. Os destiladores de whiskey são frequentemente considerados artesãos, dedicando suas vidas à busca da perfeição na produção da bebida. A cor do whiskey é influenciada pelo envelhecimento em barris de carvalho, bem como pelos grãos e métodos de destilação utilizados. O whiskey é frequentemente associado a rituais de degustação elaborados, com entusiastas apreciando a bebida em copos especiais e seguindo etapas específicas de análise sensorial.',

    'O whiskey é uma bebida que pode ser apreciada sozinha, em um momento de contemplação e relaxamento. Muitas destilarias de whiskey têm visitas guiadas e oferecem aos visitantes a oportunidade de conhecer o processo de produção da bebida. O whiskey é frequentemente usado em medicina alternativa, com algumas pessoas acreditando que ele possui propriedades curativas. O whiskey é uma bebida que evolui com o tempo, desenvolvendo sabores mais complexos à medida que envelhece. O whiskey é uma bebida que tem sido associada a celebrações, rituais religiosos e até mesmo a superstições.',

    'O whiskey é uma bebida alcoólica que deve ser apreciada com moderação, pois o consumo excessivo pode ter efeitos negativos na saúde. A indústria do whiskey tem uma rica história e desempenhou um papel importante na economia de muitos países. O whiskey é frequentemente associado a figuras históricas importantes, com muitos líderes políticos e celebridades apreciando a bebida ao longo da história. O whiskey é uma bebida que transcende fronteiras culturais e é apreciada por pessoas de todas as idades e origens. O whiskey é uma bebida clássica que nunca sai de moda, continuando a ser uma das bebidas destiladas mais populares e amadas em todo o mundo.'
  ];

  String curiosidadeAleatoria = '';

  @override
  void initState() {
    super.initState();
    // Selecionando uma curiosidade aleatória ao inicializar a tela
    curiosidadeAleatoria = getCuriosidadeAleatoria();
  }

  String getCuriosidadeAleatoria() {
    // Gerando um número aleatório para selecionar uma curiosidade da lista
    Random random = Random();
    int index = random.nextInt(curiosidadesList.length);
    return curiosidadesList[index];
  }

  @override
  Widget build(BuildContext context) {
    // Selecionando uma nova curiosidade aleatória ao abrir a tela
    curiosidadeAleatoria = getCuriosidadeAleatoria();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Curiosidades sobre Whiskey:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Exibindo a curiosidade aleatória
              Text(
                curiosidadeAleatoria,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
