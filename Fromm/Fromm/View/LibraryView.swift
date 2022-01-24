//
//  LibraryView.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/24.
//

import SwiftUI
import CoreData

struct LibraryView: View {
    @State var missions = ["", "", "", ""]
    private let columns: [GridItem] = [GridItem(.flexible(), alignment: .center)]
    
    var body: some View {
        VStack {
            UserInfoView()
            Divider()
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        ForEach(0 ..< missions.count, id: \.self) { _ in
                            MissionCell(geometry: geo)
                                .listRowInsets(EdgeInsets())
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("나의 미션")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserInfoView: View {
    var body: some View {
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
    }
}

struct MissionCell: View {
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Mission-Library") ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(height: 150, alignment: .center)
                .clipped()
            VStack {
                VStack {
                    Text("아침 일찍 도서관 가기")
                        .font(.headline)
                    Spacer()
                    Text("주중")
                        .font(.subheadline)
                    Text("08:00 AM")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                } label: {
                    Text("달성하기")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: geometry.size.width * 0.5)
                                .foregroundColor(.mint))
                }
            }
            .padding()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
