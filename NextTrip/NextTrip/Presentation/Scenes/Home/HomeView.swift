//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    let destinations: [Destination] = [
        Destination(
            name: "Madrid",
            country: "Espanha",
            countryCode: "ES",
            bioSummary: "Madri, a capital da Espanha, é uma cidade vibrante conhecida por sua rica história, arte e atmosfera animada.",
            imageName: "Madrid",
            history: "Madrid possui uma história fascinante que remonta séculos. Foi influenciada por várias culturas e civilizações ao longo do tempo.",
            geography: "Madri está localizada no centro da Espanha, cercada por montanhas. A cidade é conhecida por sua bela arquitetura, espaçosos parques e amplas avenidas.",
            language: "Espanhol",
            currency: "Euro (€)",
            bestTimeToVisit: "A primavera (abril a junho) e o outono (setembro a novembro) são considerados os melhores momentos para visitar Madri devido ao clima agradável e aos eventos culturais."
        ),
        Destination(
            name: "Rio de Janeiro",
            country: "Brasil",
            countryCode: "BR",
            bioSummary: "Rio de Janeiro é uma cidade vibrante conhecida por suas deslumbrantes praias, animado festival de Carnaval e marcos icônicos como o Cristo Redentor.",
            imageName: "Rio de Janeiro",
            history: "Rio de Janeiro possui uma rica história que remonta ao século XVI, quando foi fundada pelos portugueses. Foi a capital do Brasil até 1960.",
            geography: "Rio de Janeiro está localizada na costa sudeste do Brasil, com belas praias, montanhas e uma mistura única de paisagens urbanas e naturais.",
            language: "Português",
            currency: "Real Brasileiro (BRL)",
            bestTimeToVisit: "O melhor momento para visitar o Rio de Janeiro é durante os meses de verão (dezembro a março), quando o clima está quente e ocorrem eventos festivos."
        ),
        Destination(
            name: "Lugano",
            country: "Suíça",
            countryCode: "CH",
            bioSummary: "Lugano é uma cidade pitoresca localizada no sul da Suíça, conhecida por sua bela localização à beira do lago, charmoso centro histórico e atrações culturais.",
            imageName: "Lugano",
            history: "Lugano possui uma rica história que remonta à época romana. A cidade foi influenciada tanto pela cultura italiana quanto pela suíça ao longo dos séculos.",
            geography: "Lugano está situada às margens do Lago Lugano, cercada por montanhas. A cidade oferece paisagens naturais deslumbrantes e uma atmosfera mediterrânea.",
            language: "Italiano",
            currency: "Franco Suíço (CHF)",
            bestTimeToVisit: "O melhor momento para visitar Lugano é durante a primavera (abril a junho) e o verão (junho a setembro), quando o clima está agradável e há uma série de festivais e eventos acontecendo."
        ),
        Destination(
            name: "Cusco",
            country: "Peru",
            countryCode: "PE",
            bioSummary: "Cusco é uma cidade histórica localizada no coração dos Andes peruanos, conhecida como o ponto de partida para explorar a antiga cidade de Machu Picchu.",
            imageName: "Cusco",
            history: "Cusco foi a capital do Império Inca e possui uma rica história que remonta a milhares de anos. A cidade ainda preserva muitos vestígios da cultura inca.",
            geography: "Cusco está situada em um vale elevado nos Andes, cercada por montanhas imponentes. A região oferece paisagens deslumbrantes e trilhas para caminhadas.",
            language: "Espanhol (oficial), Quéchua",
            currency: "Novo Sol Peruano (PEN)",
            bestTimeToVisit: "A melhor época para visitar Cusco e Machu Picchu é durante a estação seca, que vai de maio a setembro. Essa época oferece clima estável e menos chuvas."
        ),
        Destination(
            name: "Sydney",
            country: "Austrália",
            countryCode: "AU",
            bioSummary: "Sydney é uma cidade cosmopolita e vibrante, conhecida por suas praias deslumbrantes, estilo de vida descontraído e icônicos pontos turísticos.",
            imageName: "Sydney",
            history: "Sydney tem uma história rica que remonta aos povos aborígenes. Foi colonizada pelos britânicos em 1788 e se tornou uma importante cidade portuária.",
            geography: "Sydney está localizada na costa leste da Austrália, com uma bela baía e praias famosas, além de parques e áreas naturais preservadas.",
            language: "Inglês",
            currency: "Dólar Australiano (AUD)",
            bestTimeToVisit: "A melhor época para visitar Sydney é durante a primavera (setembro a novembro) e o outono (março a maio), quando o clima é agradável e há eventos culturais acontecendo."
        ),

        Destination(
            name: "Nova Iorque",
            country: "Estados Unidos",
            countryCode: "US",
            bioSummary: "Nova Iorque é uma cidade icônica e vibrante, conhecida como o centro financeiro, cultural e artístico dos Estados Unidos.",
            imageName: "NovaIorque",
            history: "Nova Iorque tem uma história rica e diversificada, influenciada por imigrantes de todo o mundo. É conhecida por seus marcos famosos e como um centro de oportunidades.",
            geography: "Nova Iorque está localizada na costa leste dos Estados Unidos, com o rio Hudson ao oeste e o oceano Atlântico ao leste. A cidade possui uma paisagem urbana impressionante e diversificada.",
            language: "Inglês",
            currency: "Dólar Americano (USD)",
            bestTimeToVisit: "A melhor época para visitar Nova Iorque é na primavera (abril a junho) e no outono (setembro a novembro), quando o clima é agradável e há uma série de eventos e atividades culturais acontecendo."
        ),

        Destination(
            name: "Patagônia",
            country: "Argentina",
            countryCode: "AR",
            bioSummary: "A Patagônia é uma região deslumbrante conhecida por sua paisagem natural intocada, que inclui montanhas majestosas, geleiras impressionantes e lagos cristalinos.",
            imageName: "Patagonia",
            history: "A Patagônia tem uma história rica que remonta aos povos indígenas que habitavam a região antes da chegada dos europeus. Foi explorada e colonizada por diferentes expedições ao longo do tempo.",
            geography: "A Patagônia está localizada no extremo sul da América do Sul, abrangendo partes da Argentina e do Chile. É uma região vasta e remota, conhecida por sua natureza selvagem e paisagens de tirar o fôlego.",
            language: "Espanhol",
            currency: "Peso Argentino (ARS) e Peso Chileno (CLP)",
            bestTimeToVisit: "A melhor época para visitar a Patagônia é durante os meses de verão (dezembro a fevereiro), quando as condições climáticas são mais amenas e as atividades ao ar livre estão disponíveis."
        ),
        Destination(
            name: "Fernando de Noronha",
            country: "Brasil",
            countryCode: "BRA",
            bioSummary: "Fernando de Noronha é um paraíso tropical conhecido por suas praias deslumbrantes, águas cristalinas e rica vida marinha.",
            imageName: "Fernando de Noronha",
            history: "Fernando de Noronha tem uma história fascinante que remonta aos tempos coloniais. Foi descoberta pelos portugueses e já foi um local estratégico para defesa e comércio.",
            geography: "Fernando de Noronha é um arquipélago localizado no nordeste do Brasil, composto por 21 ilhas e ilhotas. É uma área protegida e um Patrimônio Mundial da UNESCO.",
            language: "Português",
            currency: "Real Brasileiro (BRL)",
            bestTimeToVisit: "A melhor época para visitar Fernando de Noronha é durante os meses de agosto a fevereiro, quando as condições de mergulho e observação da vida marinha são ideais."
        ),

        Destination(
            name: "Istambul",
            country: "Turquia",
            countryCode: "TR",
            bioSummary: "Istambul é uma cidade mágica que une os continentes europeu e asiático, conhecida por sua rica história, arquitetura deslumbrante e cultura vibrante.",
            imageName: "Istambul",
            history: "Istambul tem uma história milenar que remonta à época da antiga Bizâncio e Constantinopla. Foi a capital de três grandes impérios: Romano, Bizantino e Otomano.",
            geography: "Istambul está localizada no noroeste da Turquia, dividida pelo estreito do Bósforo. A cidade é famosa por seus palácios, mesquitas e mercados históricos.",
            language: "Turco",
            currency: "Lira Turca (TRY)",
            bestTimeToVisit: "A melhor época para visitar Istambul é durante a primavera (abril a junho) e o outono (setembro a novembro), quando o clima é ameno e as multidões de turistas são menores."
        ),
        Destination(
            name: "Paris",
            country: "França",
            countryCode: "FR",
            bioSummary: "Paris é uma cidade icônica e romântica, conhecida por sua arquitetura deslumbrante, museus de renome mundial e culinária requintada.",
            imageName: "Paris",
            history: "Paris tem uma história fascinante que remonta à época romana. Ao longo dos séculos, a cidade se tornou um centro de arte, cultura e política.",
            geography: "Paris está localizada no norte da França, às margens do rio Sena. A cidade é famosa por seus marcos emblemáticos, como a Torre Eiffel e a Catedral de Notre-Dame.",
            language: "Francês",
            currency: "Euro (€)",
            bestTimeToVisit: "A melhor época para visitar Paris é durante a primavera (março a junho) e o outono (setembro a novembro), quando o clima é ameno e há menos turistas."
        ),

        Destination(
            name: "Londres",
            country: "Reino Unido",
            countryCode: "GB",
            bioSummary: "Londres é uma cidade icônica e cosmopolita, conhecida por sua história fascinante, cultura diversificada e uma infinidade de atrações famosas.",
            imageName: "Londres",
            history: "Londres tem uma história rica que remonta à época romana. Ao longo dos séculos, foi um importante centro político, cultural e financeiro do mundo.",
            geography: "Londres está localizada no sudeste da Inglaterra, às margens do rio Tâmisa. A cidade é famosa por seus marcos emblemáticos, como o Palácio de Buckingham, a Torre de Londres e o Big Ben.",
            language: "Inglês",
            currency: "Libra Esterlina (GBP)",
            bestTimeToVisit: "A melhor época para visitar Londres é durante a primavera (março a maio) e o verão (junho a agosto), quando o clima é mais ameno e há uma variedade de eventos e festivais acontecendo"
        )
    ]

    let destinationss = ["Madrid", "Rio de Janeiro", "Lugano", "Cusco", "Sydney", "Nova Iorque", "Patagonia", "Fernando de Noronha", "Istambul", "Paris", "Londres"]

    let nearYou = ["mercadopublico": "Mercado público", "beirario": "Estádio Beira Rio", "marioquintana": "Casa de cultura Mario quintana", "parquefarroupilha": "Parque Farroupilha", "gasometro": "Usina do gasômetro"]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Spacer()
                    LocationView(name: "Porto Alegre, BRA")
                    Text("Qual seu próximo destino?")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "131F2A"))
                        .padding(.top, 30)

                    SearchBarView(searchText: $searchText)
                        .padding(.top, 8)

                    Text("Destinos populares")
                        .font(.system(size: 18, weight: .bold))
                        .fontWeight(.bold)
                        .padding(.top, 32)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<11) { index in
                                NavigationLink(destination: DestinationDetail(destination: destinations[index])) {
                                    MediumCardView(image: Image(destinationss[index]), withOpacity: true, centeredTitle: destinationss[index])
                                }
                                .navigationBarBackButtonHidden(true)
                            }
                        }
                    }

                    Text("Perto de você")
                        .font(.system(size: 18, weight: .bold))
                        .fontWeight(.bold)
                        .padding(.top, 32)

                    VStack(spacing: 15) {
                        ForEach(Array(nearYou), id: \.0) { item in
                            SmallListItemView(content: .init(imageString: item.0, title: item.1, distance: "2,8 km"))
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .background(Color(hex: "F5F8F9"))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
            .edgesIgnoringSafeArea(.top) //
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
