import Foundation

public class Inputs {
  public static func readFile() -> [String.SubSequence] {
    let path = Bundle.main.path(forResource: "input", ofType: "txt")
    let contents = try! String(contentsOfFile: path!)
    let lines = contents.split(separator:"\n")
    return lines
  }
}
