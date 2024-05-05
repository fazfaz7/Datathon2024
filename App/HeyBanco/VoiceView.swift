//
//  VoiceView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 04/05/24.
//

import SwiftUI

struct VoiceView: View {
    @StateObject private var viewModel = SpeechViewModel()
    @State var savedMessage: String = ""
    @State var isRecording: Bool = false
    @State var control: Bool = false
    
    var body: some View {
        VStack {
            
            HStack{
                Button {
                    if viewModel.recognitionTask == nil {
                        viewModel.startRecording()
                        print("RECORD")
                        isRecording = true
                        
                    } else {
                        savedMessage = viewModel.recognizedText
                        viewModel.stopRecording()
                        print(savedMessage)
                        print("STOP")
                        isRecording = false
                        control = true
                        viewModel.recognitionTask = nil
                        
                    }
                } label: {
                    ZStack{
                        Circle()
                            .fill(.teal)
                            .opacity(0.5)
                            .frame(width:80)
                        
                        Image(systemName: isRecording ? "square.fill" : "mic.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(20)
                }
                
                HStack{
                    
                    VStack{
                        Text("You said...")
                            .padding(.bottom,5)
                        
                        
                        
                        if control {
                            Text(savedMessage)
                                .italic()
                                .font(.title2)
                            
                        }
                    }
                
                    
                }

                
    
            }
            
        }
        .padding()
    }
}



#Preview {
    VoiceView()
}

