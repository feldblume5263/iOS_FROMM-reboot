//
//  LibraryView.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/24.
//

import SwiftUI
import CoreData

struct LibraryView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(uiImage: UIImage(named: "User-Sample") ?? UIImage())
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .scaledToFill()
                    Text("포뇨")
                        .font(.headline)
                }
                .padding()
                Spacer()
            }
            List {
                VStack {
                    Image(uiImage: UIImage(named: "Mission-Library") ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100, alignment: .center)
                        .clipped()
                    HStack {
                        VStack {
                            Text("아침 일찍 도서관 가기")
                                .font(.headline)
                            Spacer()
                            Text("주중")
                                .font(.subheadline)
                            Text("08:00 AM")
                                .font(.subheadline)
                        }
                    }
                    .padding()
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MissionCell: View {
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Mission-Library") ?? UIImage())
            VStack {
                
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
