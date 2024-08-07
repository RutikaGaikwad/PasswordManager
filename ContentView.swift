//
//  ContentView.swift
//  ManagePassword
//
//  Created by APPLE on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var showingbuttonSheet = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    AccountRow(name: "Google", password: "*******")
                    AccountRow(name: "LinkedIn", password: "********")
                    AccountRow(name: "Twitter", password: "********")
                    AccountRow(name: "Facebook", password: "********")
                    AccountRow(name: "Instagram", password: "********")
                }
                .navigationTitle("Password Manager")
            
                .toolbar {
                    NavigationLink(destination: AddAccountScreen()) {
                        VStack {
                            Spacer()
                            HStack {
                                Button(action: {
                                    showingbuttonSheet.toggle()
                                }) {
                                    Image(systemName: "plus")
                                        .buttonStyle(.borderedProminent)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding()
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                }
                                Spacer()
                            }
                            .padding()
                            .sheet(isPresented: $showingbuttonSheet){
                                buttonsheetView()
                                    .presentationDetents([ .medium])
                                    .presentationDragIndicator(.visible)
                            }
                        }
                    }
                }
            }
        }
    }
    
    //ButtonSheet
    struct buttonsheetView: View {
        @State private var accountName = ""
        @State private var usernameOrEmail = ""
        @State private var password = ""
        var body: some View {
            VStack {
                    TextField("Account Name", text: $accountName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    TextField("Username/Email", text: $usernameOrEmail)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                
                    Button("Add New Account") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .frame(height: 25)
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .background(Color.black)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                }
            .padding()
            .background(Color.gray.opacity(0.1))
            
        }
    }
    
        //AccountRow
        struct AccountRow: View {
            let name: String
            let password :String
            
            var body: some View {
                HStack {
                    Text(name)
                        .font(.headline)
                    Spacer()
                    Text(password)
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }
    
        //AddAccountScreen
        struct AddAccountScreen: View {
            @State private var accountName = ""
            @State private var usernameOrEmail = ""
            @State private var password = ""
            
            var body: some View {
                VStack {
                    
                    TextField("Account Name", text: $accountName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    TextField("Username/Email", text: $usernameOrEmail)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button("Add New Account") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
        }
    }


#Preview {
    ContentView()
}
