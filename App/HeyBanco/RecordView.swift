//
//  RecordView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 05/05/24.
//

import SwiftUI

struct RecordView: View {
    @StateObject private var viewModel = SpeechViewModel()
    @State var savedMessage: String = ""
    @State var isRecording: Bool = false
    @State var control: Bool = false
    @State var listaMovimientos: [Movimiento] = []
    @State var nuevomensaje: String = ""
    
    
    var body: some View {
        VStack{
            VStack{
                Spacer()
                HStack{
                    
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                        .padding(.bottom)
                    
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .padding(.leading)
                        .padding(.bottom)
                        .padding(.trailing, 20)
                    
                    
                }
                
            }
            .frame(width: 400, height: 90)
            .background(.darkBlue)
            
            Image("holahey")
                .padding()
            
            Button {
                if viewModel.recognitionTask == nil {
                    viewModel.startRecording()
                    isRecording = true
                    
                } else {
                    savedMessage = viewModel.recognizedText
                    nuevomensaje = savedMessage
                    viewModel.stopRecording()
                    print(savedMessage)
                    print("STOP")
                    isRecording = false
                    control = true
                    viewModel.recognitionTask = nil
                    
                    DispatchQueue.main.async {
                        
                        Task {
                            print("hola")
                            await fetchMicData(userAudio: nuevomensaje)
                            
                        }
                        /*let newMovimiento = Movimiento(concepto: nuevomensaje)

                        withAnimation{
                            listaMovimientos.insert(newMovimiento, at: 0)
                        }
                         */
                    }
                    
                    
                }
            } label: {
                
                Image(systemName: isRecording ? "square.fill" : "mic.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.orange)
                    .frame(width: 100, height: 75)
                    .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.white))
                    .shadow(radius: 10)
                
            }
            
            Text("Registrar movimiento")
                .fontWeight(.semibold)
                .padding()
                .font(.title2)
            
            HStack{
                Text("Movimientos")
                    .padding()
                    .font(.title2)
                
                Spacer()
                Text("Hoy")
                
                
                Image(systemName: "chevron.down")
                    .padding(.trailing,25)
                
            }.frame(width: 400,height: 40)
                .background(.gray)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView{
                
                ForEach(listaMovimientos, id: \.concepto) { movimiento in
                    HStack {
                        Image(systemName: "mic.circle.fill")
                            .padding()
                            .padding(.leading,5)
                            .foregroundStyle(movimiento.tipo == "ingreso" ? .green : .red)
                            .font(.title)
                        
                        
                        
                        VStack (alignment: .leading) {
                            Text(movimiento.concepto)
                                .fontWeight(.semibold)
                            Text("2:00pm")
                                .font(.footnote)
                                .fontWeight(.thin)
                            
                        }
                        Spacer()
                        
                        Text("$\(movimiento.monto).00")
                            .padding(.trailing,35)
                    }.frame(width: 400, height: 60)
                        .background(.heyGray)
                }
                 
            
            }.frame(height: 300)
            
            
            
            Spacer()
        }.ignoresSafeArea(.all)
    }
    
    func fetchMicData(userAudio: String) async {
        
        
        guard let url = URL(string: "https://soldier-programmers-warehouse-headline.trycloudflare.com") else {
            print("No sirve el URL")
            return
        }
        
        let body: [String: String] = ["messages": userAudio]
        
        
        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }
        
        print(finalBody)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            
            guard let data = data, err == nil else {return}
            
            let result = try? JSONDecoder().decode(Response.self, from: data)
            if let result = result?.response {
                DispatchQueue.main.async {
                    
                    let newMovimiento = result

                    withAnimation{
                        listaMovimientos.insert(newMovimiento, at: 0)
                    }
                
                    
                    
                }
            }
            
        
        }.resume()
    }
}

#Preview {
    RecordView()
}

struct Movimiento: Codable {
    var concepto: String
    var monto: String = "$200.00"
    var tipo: String = "egreso"
}

struct Response: Codable {
    var response: Movimiento
}
