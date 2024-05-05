//
//  MainView.swift
//  HeyBanco
//
//  Created by Adrian Faz on 04/05/24.
//

import SwiftUI
import UserNotifications

struct MainView: View {
    @State var abierto: Bool = false
    
    var body: some View {
        NavigationStack{
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
                                Button {
                                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
                                        if success {
                                            print("All set!")
                                        } else if let error {
                                            print(error.localizedDescription)
                                        }
                                    }
                                } label: {
                                    Image(systemName: "slider.horizontal.3")
                                        .foregroundStyle(.white)
                                        .padding(.horizontal)
                                    
                                }
                                
                                Button {
                                    
                                    let content = UNMutableNotificationContent()
                                    content.title = "Registra tu compra!"
                                    content.subtitle = "Detectamos que estás cerca de un establecimiento. Da click para registrar tu compra con voz."
                                    content.sound = UNNotificationSound.default
                                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
                                    
                                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                    
                                    UNUserNotificationCenter.current().add(request)
                                    
                                } label: {
                                    Image(systemName: "person")
                                        .foregroundStyle(.white)
                                }
                                
                                

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
                                    
                                    
                                    NavigationLink {
                                        HeyPlanView()
                                            .ignoresSafeArea(.all)
                                            .navigationBarBackButtonHidden()
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
                        
                        HStack{
                            
                            Image(systemName: "creditcard.fill")
                                .foregroundStyle(.yellow)
                                .padding(.leading)
                            
                            
                            VStack (alignment: .leading) {
                                Text("Tarjeta de crédito Hey")
                                    .fontWeight(.medium)
                                    .font(.system(size: 13))
                                
                                Text("Quiero mi tarjeta Hey, obténla en 3 minutos")
                                    .foregroundStyle(.black)
                                    .fontWeight(.thin)
                                    .font(.system(size: 10))
                            }
                            .padding(.leading,5)
                            
                            Spacer()
                            
                            
                            
                            
                            
                        }
                        .frame(width: 400, height: abierto ? 100 : 60)
                        .background(.white)
                        
                        HStack{
                            
                            Image(systemName: "creditcard.fill")
                                .foregroundStyle(.heyOrange)
                                .padding(.leading)
                            
                            
                            VStack (alignment: .leading) {
                                Text("Tarjeta de crédito Hey con Garantía")
                                    .fontWeight(.medium)
                                    .font(.system(size: 13))
                                
                                Text("Crea o mejora tu historial crediticio depositando un monto como garantía desde $1,500 pesos.")
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
                        
                        
                        
                        
                        
                        
                        
                        
                        Spacer()
                    }
                }
            }.ignoresSafeArea(.all)
        }.ignoresSafeArea(.all)
            
    }
}

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



#Preview {
    MainView()
}

