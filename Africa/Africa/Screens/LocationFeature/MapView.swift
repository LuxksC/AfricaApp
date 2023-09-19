//
//  MapView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel: MapViewModel = MapViewModel()
    
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    var body: some View {
        if viewModel.isLoading {
            LoaderView()
        } else if let error = viewModel.errorMessage, !viewModel.isLoading {
            ErrorView(message: error) { viewModel.loadData() }
        } else {
            contentView
        }
    }
    
    var contentView: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: viewModel.locations,
            annotationContent: { item in
                
                // MARK: - PIN: OLD STYLE (always static)
//                MapPin(coordinate: item.location, tint: .accentColor)
                
                // MARK: - MARKER: NEW STYLE (always static)
//                MapMarker(coordinate: item.location, tint: .accentColor)
                
                // MARK: - CUSTOM BASIC ANOTATION (can be interactive)
//                MapAnnotation(coordinate: item.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, alignment: .center)
//                }
                
                // MARK: - CUSTOM ADVANCED ANOTATION (can be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnotationView(location: item)
                }
            }
        )
        .overlay(alignment: .center) {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 8)
                .foregroundColor(.secondary)
        }
        .overlay(alignment: .top) {
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
