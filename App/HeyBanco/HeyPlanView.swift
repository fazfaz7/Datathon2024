//
//  HeyPlanView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 04/05/24.
//

import SwiftUI

struct HeyPlanView: View {
    var body: some View {
        NavigationStack{
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
                ScrollView{
                    VStack {
                        Image("heyplan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270)
                            .padding(.vertical,5)
                        ZStack{
                            Image("tarjetahey")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350)
                                .padding(.bottom)
                                .shadow(radius: 20)
                            
                            Text("$5,000.00")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .padding(.leading,110)
                                .fontWeight(.medium)
                                .padding(.bottom,50)
                            
                            
                        }
                    }
                    
                    HStack(spacing: 40) {
                        VStack{
                            
                            
                            Image("Scholarship")
                            
                            Text("Control")
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        NavigationLink{
                            RecordView()
                                .navigationBarBackButtonHidden()
                        } label:{
                            VStack{
                                Image(systemName: "mic")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 38))
                                    .padding(3)
                                
                                Text("Hola, Hey")
                                    .foregroundStyle(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.leading,5)
                        }
                        VStack{
                            
                            Image("Money Box")
                                .padding(8)
                            
                            
                            Text("Plan retiro")
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .padding()
                    .frame(width: 360,height: 130)
                    .background(RoundedRectangle(cornerRadius: 40).fill(.heyOrange))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
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
                    
                    MovimientosView(icono: "creditcard.fill", titulo: "Ropa deportiva", hora: "4:15 pm", costo: "$210.99", color: .black)
                    MovimientosView(icono: "mic.circle.fill", titulo: "Compra galletas", hora: "7:23 pm", costo: "$22.50", color: .red)
                    MovimientosView(icono: "mic.circle.fill", titulo: "Regalo cumpleaños", hora: "11:37 am", costo: "$500.00", color: .heyGreen)
                    MovimientosView(icono: "creditcard.fill", titulo: "Vuelo Cancún", hora: "1:02 pm", costo: "$2,456.30", color: .black)
                    
                    
                    
                    Spacer()
                    
                }
            }.ignoresSafeArea(.all)
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    HeyPlanView()
}

struct MovimientosView: View {
    var icono: String
    var titulo: String
    var hora: String
    var costo: String
    var color: Color
    var body: some View {
        HStack {
            Image(systemName: icono)
                .padding()
                .padding(.leading,5)
                .foregroundStyle(color)
                .font(.title)
            
            
            
            VStack (alignment: .leading) {
                Text(titulo)
                    .fontWeight(.semibold)
                Text(hora)
                    .font(.footnote)
                    .fontWeight(.thin)
                
            }
            Spacer()
            
            Text(costo)
                .padding(.trailing,35)
        }.frame(width: 400, height: 60)
            .background(.heyGray)
    }
}
