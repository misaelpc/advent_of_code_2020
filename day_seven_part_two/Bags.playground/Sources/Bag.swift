import Foundation

public class Bag {
  public let color: String
  public let identifier = UUID().uuidString
  var numberOfBags = 0
  public var contains: [String: Bag] = [:]
  public var containsRawBags: [String] = []
  
  public init(color: String) {
    self.color = color
  }
  
  public func addContainBag(containingBag: Bag) {
    contains[containingBag.color] = containingBag
  }
}

public class BagRepository {
  public static let shared = BagRepository()
      
  var locationGranted: Bool?

  private init(){}
  var collection: [ String: Bag] = [:]
  
  public func addBag(color: String, bag: Bag) {
    if collection[color] == nil {
      collection[color] = bag
    }
  }
  
  public func updateBag(bag: Bag) {
    collection[bag.color] = bag
  }
  
  public func getBag(color: String) -> Bag {
    collection[color]!
  }
  
  public func attachBag(color: String, quantity: Int, parentBag: Bag) {
    if color == "no other" { return }
    if collection[color] == nil {
      let containingBag = Bag(color: color)
      collection[color] = containingBag
      parentBag.addContainBag(containingBag: containingBag)
      parentBag.numberOfBags = quantity
    } else {
      let childBag = collection[color]
      parentBag.addContainBag(containingBag: childBag!)
      parentBag.numberOfBags = quantity
    }
  }
  
  public func parseShinyPath() {
    var counter = 0
    for key in collection.keys {
      let currentBag = collection[key]
      if currentBag!.color == "shiny gold" {
        counter += 1
        continue
      } else {
        for containingKey in currentBag!.contains.keys {
          let containingBag = currentBag!.contains[containingKey]
          debugPrint(containingBag!.color)
          debugPrint(containingBag!.identifier)
          if containingBag!.color == "shiny gold" {
            counter += 1
            continue
          }
        }
      }
    }
    debugPrint(counter)
  }
  
  public func parseContainingBags() {
    debugPrint(collection)
    for key in collection.keys {
      let currentBag = collection[key]
      debugPrint(currentBag!.color)
      debugPrint(currentBag!.contains)
    }
  }
  
  public func printCollection() {
    debugPrint(collection)
  }
}
