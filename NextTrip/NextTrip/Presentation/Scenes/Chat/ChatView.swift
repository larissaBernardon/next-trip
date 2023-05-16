//
//  ChatView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//
import AsyncHTTPClient
import OpenAIKit
import NIO
import SwiftUI

struct ChatView: View {

    // MARK: - State properties

    @State var message: String = ""
    @State var chatHistory: [String] = []

    // MARK: - Properties

    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
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

    var body: some View {
        VStack {
            List(chatHistory, id: \.self) { message in
                Text(message)
                    .foregroundColor(Color.darkGray)
            }
            .listStyle(.sidebar)
            .background(Color.darkGray)

            HStack {
                TextField("Type your message", text: $message)

                Button(action: {
                    sendMessage()
                }, label: {
                    Text("Send")
                })
                .padding(5)
            }
            .padding()
            .background(Color.mediumGray.ignoresSafeArea(.all))
            .cornerRadius(10)
        }
        .background(Color.darkGray.ignoresSafeArea(.all))
        .padding()
    }

    func sendMessage() {
        Task {
            await getChatResponse(for: message) { response in
                DispatchQueue.main.async {
                    chatHistory.append(message)
                    chatHistory.append(response)

                    message = ""
                }
            }
        }
    }

    func getChatResponse(for message: String, completion: @escaping (String) -> Void) async {
        do {
            let response = try await openAIClient.completions.create(
                model: Model.GPT3.davinci,
                prompts: [message],
                maxTokens: 100
            )
            print(response.choices.first?.text ?? "")
            completion(response.choices.first?.text ?? "default response")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
