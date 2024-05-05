//
//  ContentView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 04/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var abierto: Bool = false
    var body: some View {
        
        VStack{
            

                    TabView {
                        MainView()
                            .tabItem {
                                Label("Inicio", systemImage: "house")
                                
                            }

                        MainView()
                            .tabItem {
                                Label("Pagos", systemImage: "dollarsign.circle")
                            }
                        
                        MainView()
                            .tabItem {
                                Label("Mi Hey", systemImage: "face.smiling")
                            }
                        
                        MainView()
                            .tabItem {
                                Label("HeyFPT", systemImage: "message")
                            }
                        
                        MainView()
                            .tabItem {
                                Label("Buzón", systemImage: "tray")
                            }
                    }
                    

            
        }
        /*
        ZStack{
            Color.heyGray
            VStack {
                
                VStack{
                    Spacer()
                    HStack{
                        Image("heylogowhite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Panchito")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.bottom, 13)
                            .font(.title3)
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "slider.horizontal.3")
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                            
                            
                            Image(systemName: "person")
                                .foregroundStyle(.white)
                        }.padding(.horizontal)
                            .padding(.bottom)
                        
                        
                    }
                    
                }
                .frame(width: 400, height: 100)
                .background(.darkBlue)
                
                ScrollView{
                    HStack{
                        
                        Text("Mis productos contratados")
                            .fontWeight(.bold)
                            .padding(4)
                        
                        
                        Spacer()
                        Button {
                            
                        } label:
                        {
                            Text("Ocultar saldos")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .padding(10)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        
                        ProductsView(color: .heyPurple, title: "Cuentas", icon: "rectangle.fill", subtitle: "Suma total de las cuentas")
                        
                        
                        ProductsView(color: .heyOrange, title: "Recompensas", icon: "dollarsign.circle.fill", subtitle: "Total recompensas")
                        
                        
                        ProductsView(color: .heyGreen, title: "Hey Coins", icon: "dollarsign.circle.fill", subtitle: "Total Hey Coins")
                        
                        HStack{
                            
                            Image(systemName: "paperplane.fill")
                                .foregroundStyle(.teal)
                                .padding(.leading)
                            Text("Hey Plan")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                            
                            Spacer()
                            
                            VStack (alignment: .trailing){
                                
                                
                                Button {
                                    
                                } label: {
                                    Text("Ir")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal,5)
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.teal))
                                        .padding(.trailing)
                                    
                                }.padding(.trailing)
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        .frame(width: 400, height: abierto ? 100 : 60)
                        .background(.white)
                        .padding(.bottom, 10)
                        /*.onTapGesture {
                         withAnimation {
                         abierto.toggle()
                         }
                         }
                         */
                        
                        
                    }
                    
                    
                    HStack{
                        
                        Text("Mis ofertas")
                            .fontWeight(.bold)
                            .padding(4)
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        
                        Image(systemName: "rectangle.fill")
                            .foregroundStyle(.black)
                            .padding(.leading)
                        
                        
                        VStack (alignment: .leading) {
                            Text("Cambia tu nómina a Hey Banco")
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                            
                            Text("Y obtén todos los beneficios de ser Hey Pro")
                                .foregroundStyle(.black)
                                .fontWeight(.thin)
                                .font(.system(size: 10))
                        }
                        .padding(.leading,5)
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }
                    .frame(width: 400, height: abierto ? 100 : 60)
                    .background(.white)
                    .padding(.bottom, 10)
                    
                
                    HStack{
                        
                        Text("Productos disponibles para ti")
                            .fontWeight(.bold)
                            .padding(4)
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                    Spacer()
                }
            }
        }.ignoresSafeArea(.all)
         */
        
    }
}

/*
struct ProductsView: View {
    var color: Color
    var title: String
    var icon: String
    var subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundStyle(color)
                .padding(.leading)
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 14))
            
            Spacer()
            
            VStack (alignment: .trailing){
                Text("$0.00")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Text(subtitle)
                    .font(.system(size: 9.5))
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
            
            
            
        }
        .frame(width: 400, height: 60)
        .background(.white)
        .padding(.bottom, 10)
    }
    
}
*/


#Preview {
    ContentView()
}

