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
  
  static func readFileLineByLine(_ path: String) -> [String] {
    var passports: [String] = []
    var currentPassport = ""
      errno = 0
      if freopen(path, "r", stdin) == nil {
          perror(path)
          return []
      }
      while let line = readLine() {
        if line == "" {
          let storePassport = currentPassport
          passports.append(storePassport)
          currentPassport = ""
        } else {
          currentPassport += " \(line)"
        }
      }
    if currentPassport.count > 0 {
      passports.append(currentPassport)
    }
    return passports
  }
  
  public static func readFile() -> [String] {
    let path = Bundle.main.path(forResource: "input", ofType: "txt")
    return readFileLineByLine(path!)
  }
}
