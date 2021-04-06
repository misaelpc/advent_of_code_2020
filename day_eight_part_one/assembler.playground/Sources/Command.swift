import Foundation

public enum Mnemonic {
  case nop
  case acc
  case jmp
}

public class Command: NSCopying {
  var executionCounter = 0
  var mnemocic: Mnemonic
  var instruction: Int
    
  public init(mnemonic: Mnemonic, instruction: Int) {
    self.mnemocic = mnemonic
    self.instruction = instruction
  }
  
  public func copy(with zone: NSZone? = nil) -> Any {
    let copyCommand = Command(mnemonic: mnemocic, instruction: instruction)
    return copyCommand
  }
  
  public func getMnemonic() -> Mnemonic {
    return mnemocic
  }
  
  public func setMnemonic(mnemonic: Mnemonic) {
    self.mnemocic = mnemonic
  }
  
  public func getJumpCount() -> Int {
    return instruction
  }
  
  public func getAcumulator() -> Int {
    return instruction
  }
  
  public func incExecutionCount() {
    executionCounter += 1
  }
  
  public func shouldExit() -> Bool {
    if executionCounter >= 1 {
      return true
    } else {
      return false
    }
  }
}

public extension Array where Element: Equatable {
    public func all(where predicate: (Element) -> Bool) -> [Element]  {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}
