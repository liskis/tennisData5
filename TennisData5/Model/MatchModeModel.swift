class Person: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""

    var name : String {
        get {
            firstName + " " + lastName
        }
    }
}
