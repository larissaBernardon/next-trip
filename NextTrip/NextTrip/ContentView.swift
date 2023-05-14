//
//  ContentView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//

import NIO
import AsyncHTTPClient
import OpenAIKit
import SwiftUI

struct ContentView: View {

    //MARK: - properties

    let configuration: Configuration
    let eventLoopGroup: MultiThreadedEventLoopGroup
    let httpClient: HTTPClient
    let openAIClient: Client

    //MARK: - initializar

    init() {
        configuration = Configuration(apiKey: "")
        eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        httpClient = HTTPClient(eventLoopGroupProvider: .shared(eventLoopGroup))
        openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }

    //MARK: - View structure

    var body: some View {
        VStack {
            Button("TEST") {
                Task {
                    await requestWithPrompt("Olá chatgpt, qual a melhor cidade para morar na itália?")
                }
            }
        }
        .padding()
        .onDisappear() {
            try? httpClient.syncShutdown()
        }
    }

    func requestWithPrompt(_ prompt: String) async {
        do {
            let response = try await openAIClient.completions.create(
                model: Model.GPT3.davinci,
                prompts: [prompt]
            )
            print(response.choices.first?.text as Any)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
