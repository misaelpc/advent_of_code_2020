import Foundation

public class Inputs {
  
  public static func multiplyForest(times: Int, singleForest: [String.SubSequence]) -> [String.SubSequence] {
    var bigForest: [String.SubSequence] = []
    for row in singleForest {
      var appendRow: String.SubSequence = ""
      for _ in 1...times {
        appendRow += row
      }
      bigForest.append(appendRow)
    }
    return bigForest
  }
  
  public static func readFile() -> [String.SubSequence] {
    let path = Bundle.main.path(forResource: "input", ofType: "txt")
    let contents = try! String(contentsOfFile: path!)
    let lines = contents.split(separator:"\n")
    return lines
  }
}
