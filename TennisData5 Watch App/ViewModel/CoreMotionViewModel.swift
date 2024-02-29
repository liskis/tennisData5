//
//  CoreMotion.swift
//  TennisData5 Watch App
//
//  Created by 渡辺健輔 on 2024/02/29.
//

import Foundation
import CoreMotion

class CoreMotionViewModel: ObservableObject {
    
    @Published var numberOfSteps: NSNumber = 0
    
    func getNumberOfStep(gameStartDate: Date) {
        let pedometer = CMPedometer()

        //CMPedometerが利用可能かどうか
        if CMPedometer.isStepCountingAvailable() {
            //計測
            pedometer.queryPedometerData(from: gameStartDate, to: Date(), withHandler: {(pedometerData, error) in
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
                guard let data = pedometerData else {
                    print(pedometerData!.numberOfSteps)
                    return
                }
                self.numberOfSteps = data.numberOfSteps
                
//                DispatchQueue.main.async {
//                    label.text = "\(step) 歩"
//                }
            })
        }
        print(self.numberOfSteps)
        //終わらせたいタイミングで
//        pedometer.stopUpdates()
    }
}
