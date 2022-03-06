//
//  PrivateMissionCreatingView.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/26.
//

import SwiftUI
import MapKit

// MARK: - https://stackoverflow.com/questions/56533059/how-to-get-current-location-with-swiftui
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var lastKnownLocation: CLLocation?

    func startUpdating() {
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        lastKnownLocation = locations.last
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

class PrivateMissionViewModel: ObservableObject {
    
    @Published var newMission = PrivateMission(name: "", image: UIImage(), date: [true, true, true, true, true, false, false], time: 0, location: MissionCoordinate(x: 0, y: 0))
}

struct PrivateMissionCreatingView: View {
    @State private var currentDate = Date()
    @ObservedObject var missionViewModel = PrivateMissionViewModel()
    @Binding var missions: [PrivateMission]
    let dayOfWeeks = ["월", "화", "수", "목", "금", "토", "일"]
    
    var body: some View {
        Form {
            Section(header: Text("어떤 미션을?").font(.headline).foregroundColor(Color.primary).padding(5)) {
                TextField("미션의 이름을 적어주세요!", text: $missionViewModel.newMission.name)
                    .font(.headline)
            }
            Section(header: Text("매주 언제?").font(.headline).foregroundColor(Color.primary).padding(5)) {
                HStack {
                    Spacer()
                    ForEach(0 ..< dayOfWeeks.count, id: \.self) { dayOfWeek in
                        Button {
                            missionViewModel.newMission.date[dayOfWeek].toggle()
                        } label: {
                            Circle()
                                .fill(missionViewModel.newMission.date[dayOfWeek] ? Color.mint : Color.clear)
                                .overlay(
                                    Text(dayOfWeeks[dayOfWeek])
                                        .font(.headline)
                                        .padding(10)
                                        .foregroundColor(missionViewModel.newMission.date[dayOfWeek] ? Color.white : Color.mint))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer()
                    }
                }
            }
            Section(header: Text("몇 시까지?").font(.headline).foregroundColor(Color.primary).padding(5)) {
                HStack {
                    Text("선택한 요일의 ")
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    Text(" 전 까지")
                    Spacer()
                }
            }
            Section(header: Text("어디로?").font(.headline).foregroundColor(Color.primary).padding(5)) {
                HStack {
                    Button {
                        
                    } label: {
                        // Mpaview 추가 필요
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.mint)
                            .overlay(Text("위치 변경하기").foregroundColor(Color.white))
                            .frame(height: 150)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

//struct PrivateMissionCreatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrivateMissionCreatingView()
//    }
//}
