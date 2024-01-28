import RealmSwift
import SwiftUI
class DataStorageViewModel: ObservableObject {
    @ObservedObject var pointDataModel = PointDataModel()
}
