//
//  Prompts.swift
//  NextTrip
//
//  Created by larissa.bernardon on 12/07/23.
//

import Foundation

public struct Prompts {

    let getDestinationList = """
    A partir das seguintes estruturas:

    struct DestinationList: Codable {
        let destinations: [Destination]
    }

    struct Destination: Codable {
        let name: String
        let country: String
        let countryCode: String
        let bioSummary: String
        let imageName: String
        let history: String
        let geography: String
        let language: String
        let currency: String
        let bestTimeToVisit: String
    }

    Retorne 6 destinos de viagem populares pelo mundo em formato json para que minha aplicação consiga interpretar.
    O conteudo da resposta deve ser em portugues.
    Image name pode ter o mesmo valor retornado em name.
    """

    let createTripPlan = """
    A partir das seguintes estruturas:

    struct TripPlan: Codable {
        let dates: TripDates
        let days: [Day]
    }

    struct Day: Codable {
        let day: String
        let activities: [Activity]
    }

    struct TripDates: Codable {
        let startDate: Date
        let endDate: Date
    }

    struct Activity: Codable {
        let title: String
        let description: String
        let location: Location
    }

    struct Location: Codable {
        let latitude: Double
        let longitude: Double
    }

    Monte um roteiro de 5 dias de viagem em Madrid levando em consideração as seguintes preferencias de viagem: Cultura, experiências gastronômicas.
    O conteudo da resposta deve ser em português.
    O campo day deve conter a data do dia no fotmato "dd/mm"
    Retorne em formato json para que minha aplicação consiga interpretar.
    """

    let createRioCurrentTripPlan = """
    A partit das seguintes estruturas:

   struct TripPlan: Codable {
       let dates: TripDates
       let days: [Day]
   }

   struct Day: Codable {
       let day: String
       let activities: [Activity]
   }

   struct TripDates: Codable {
       let startDate: Date
       let endDate: Date
   }

   struct Activity: Codable {
       let title: String
       let description: String
       let location: Location
   }

   struct Location: Codable {
       let latitude: Double
       let longitude: Double
   }

   Monte um roteiro de 4 dias de viagem no Rio de janeiro levando em consideração as seguintes preferencias de viagem: Cultura, Atividades ao ar livre, Economico.
   O conteudo da resposta deve ser em português.
   O campo day deve conter a data do dia no fotmato "dd/mm"
   Retorne em formato json para que minha aplicação consiga interpretar.
   """
}
