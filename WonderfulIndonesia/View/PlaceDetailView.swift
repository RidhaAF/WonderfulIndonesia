//
//  PlaceDetailView.swift
//  WonderfulIndonesia
//
//  Created by Ridha Ahmad Firdaus on 01/08/22.
//

import SwiftUI

struct PlaceDetailView: View {
    @State var place: Place
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: place.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 256)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(place.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color.red)
                    Text(String(place.like))
                        .font(.callout)
                }
                Text(place.address)
                    .font(.headline)
                    .foregroundColor(.secondary)
                HStack {
                    Text("Longitude: \(String(place.longitude))")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text("Latitude: \(String(place.latitude))")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 8.0)
                Text(place.description)
                    .font(.body)
            }
            .padding([.leading, .bottom, .trailing])
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    @State var place: Place
    
    static var previews: some View {
        PlaceDetailView(place: Place(id: 0, name: "String", description: "String", address: "String", longitude: 0.0, latitude: 0.0, like: 0, image: "String"))
    }
}
