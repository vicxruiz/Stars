import UIKit

var str = "Hello, playground"

//documents directory


let fileManager = FileManager.default
let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

// /Users/vick/documents/

let location = documentsDirectory.appendingPathComponent("star.plist")

// /Users/vick/Documents/star.plist

//create a file
//save to disk

struct Star: Codable {
    var name: String
    var distance: Double
}
let star = Star(name: "Sun", distance: 100)


let encoder = PropertyListEncoder()
do {
    let data = try encoder.encode(star)
    print(data)
    try data.write(to: location)
} catch {
    print("Error saving to disk: \(error)")
}


//load from disk
let decoder = PropertyListDecoder()
do {
    let data = try Data(contentsOf: location)
    let loadedStar = try decoder.decode(Star.self, from: data)
    print("Star: \(loadedStar)")
} catch {
    print("error: \(error)")
}
//inspect finder/terminal


