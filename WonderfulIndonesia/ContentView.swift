//
//  ContentView.swift
//  WonderfulIndonesia
//
//  Created by Ridha Ahmad Firdaus on 31/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                PlacesList()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlacesList: View {
    @StateObject var fetch = PlaceController()
    
    var body: some View {
        NavigationView {
            List(fetch.places) { place in
                NavigationLink(destination: PlaceDetailView(place: place)) {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: place.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 45, height: 45)
                        .cornerRadius(4.0)
                        VStack(alignment: .leading) {
                            Text(place.name)
                                .font(.headline)
                                .bold()
                            Text(place.address)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.vertical, 4.0)
            }
            .navigationTitle("Wonderful Indonesia")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(Circle())
                }
            }
            .onAppear {
                fetch.getPlaces { (places) in
                    self.fetch.places = places
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
