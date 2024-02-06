//import SwiftUI
//struct SnglsPointBtnArea: View {
//    @ObservedObject var positionVM: PositionViewModel
//    @ObservedObject var pointVM: PointViewModel
//    var body: some View {
//        HStack(spacing:1){
//            if positionVM.position == .NoSelection {
//                getPointBtnDis
//                lostPointBtnDis
//            } else {
//                getPointBtn
//                lostPointBtn
//            }
//        }
////        HStack(spacing:1){
////            myWinnerBtn
////            opponentWinerBtn
////        }
////        HStack(spacing:1){
////            opponentMissBtn
////            myMissBtn
////        }
//    }
//    var getPointBtnDis: some View {
//        Text("ポイントをとった")
//            .frame(height: 30)
//            .frame(maxWidth: .infinity)
//            .foregroundColor(Color.white)
//            .bold()
//            .font(.custom("Verdana", size: 8))
//            .background(
//                RoundedRectangle(cornerRadius: 2)
//                    .fill(.gray)
//            )
//            
////        Button(action: {
////
////        },label:{
////            Text("ポイントをとった")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
//    }
//    var getPointBtn: some View {
//        Text("ポイントをとった")
//            .frame(height: 30)
//            .frame(maxWidth: .infinity)
//            .foregroundColor(Color.white)
//            .bold()
//            .font(.custom("Verdana", size: 8))
//            .background(
//                RoundedRectangle(cornerRadius: 2)
//                    .fill(.red)
//            )
//            .onTapGesture {
//                if positionVM.position != .NoSelection {
//                    pointVM.myPoint += 1
//                    positionVM.position = .NoSelection
//                    pointVM.service = .first
//                }
//            }
////        Button(action: {
////            if positionVM.position != .NoSelection {
////                pointVM.myPoint += 1
////                positionVM.position = .NoSelection
////                pointVM.service = .first
////            }
////        },label:{
////            Text("ポイントをとった")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.red}
////        .cornerRadius(1)
////        .padding(1)
//    }
//    var lostPointBtnDis: some View {
//        Text("ポイントをとられた")
//            .frame(height: 30)
//            .frame(maxWidth: .infinity)
//            .foregroundColor(Color.white)
//            .bold()
//            .font(.custom("Verdana", size: 8))
//            .background(
//                RoundedRectangle(cornerRadius: 2)
//                    .fill(.gray)
//            )
////        Button(action: {
////
////        },label:{
////            Text("ポイントをとられた")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
//    }
//    var lostPointBtn: some View {
//        Text("ポイントをとられた")
//            .frame(height: 30)
//            .frame(maxWidth: .infinity)
//            .foregroundColor(Color.white)
//            .bold()
//            .font(.custom("Verdana", size: 8))
//            .background(
//                RoundedRectangle(cornerRadius: 2)
//                    .fill(.blue)
//            )
//            .onTapGesture {
//                if positionVM.position != .NoSelection {
//                    pointVM.opponentPoint += 1
//                    positionVM.position = .NoSelection
//                    pointVM.service = .first
//                }
//            }
////        Button(action: {
////            if positionVM.position != .NoSelection {
////                pointVM.opponentPoint += 1
////                positionVM.position = .NoSelection
////                pointVM.service = .first
////            }
////        },label:{
////            Text("ポイントをとられた")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.blue}
////        .cornerRadius(1)
////        .padding(1)
//    }
////    var myWinnerBtn: some View {
////        Text("自分が決めた")
////            .frame(height: 30)
////            .frame(maxWidth: .infinity)
////            .foregroundColor(Color.white)
////            .bold()
////            .font(.custom("Verdana", size: 8))
////            .background(
////                RoundedRectangle(cornerRadius: 1)
////                    .fill(.gray)
////            )
////            .onTapGesture {
////
////            }
////        Button(action: {
////
////        },label:{
////            Text("自分が決めた")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
////    }
////    var opponentMissBtn: some View {
////        Text("相手がミス")
////            .frame(height: 20)
////            .frame(maxWidth: .infinity)
////            .foregroundColor(Color.white)
////            .bold()
////            .font(.custom("Verdana", size: 6))
////            .background(
////                RoundedRectangle(cornerRadius: 1)
////                    .fill(.gray)
////            )
////            .onTapGesture {
////
////            }
////        Button(action: {
////
////        },label:{
////            Text("相手がミス")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
////    }
////    var opponentWinerBtn: some View {
////        Text("相手が決めた")
////            .frame(height: 20)
////            .frame(maxWidth: .infinity)
////            .foregroundColor(Color.white)
////            .bold()
////            .font(.custom("Verdana", size: 6))
////            .background(
////                RoundedRectangle(cornerRadius: 1)
////                    .fill(.gray)
////            )
////            .onTapGesture {
////
////            }
////        Button(action: {
////
////        },label:{
////            Text("相手が決めた")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
////    }
////    var myMissBtn: some View {
////        Text("自分がミス")
////            .frame(height: 20)
////            .frame(maxWidth: .infinity)
////            .foregroundColor(Color.white)
////            .bold()
////            .font(.custom("Verdana", size: 6))
////            .background(
////                RoundedRectangle(cornerRadius: 1)
////                    .fill(.gray)
////            )
////            .onTapGesture {
////
////            }
////        Button(action: {
////
////        },label:{
////            Text("自分がミス")
////                .foregroundColor(Color.white)
////                .bold()
////                .font(.custom("Verdana", size: 6))
//////                .frame(height: 20)
////                .padding(1)
////        })
////        .frame(height: 20)
////        .background{Color.gray}
////        .cornerRadius(1)
////        .disabled(true)
////        .padding(1)
////    }
//}
