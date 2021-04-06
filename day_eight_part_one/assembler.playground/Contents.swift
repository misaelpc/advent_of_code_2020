import UIKit

let rawProgram = Inputs.readFile()

func parseRawProgram() -> [Command] {
  var commands: [Command] = []
  for commandLine in rawProgram {
    let commandList = commandLine.split(separator: " ")
    let mnemonic = parseMnemonic(rawMnemonic: String(commandList[0]))
    let instruction = parseInstruction(instruction: String(commandList[1]))
    let command = Command(mnemonic: mnemonic, instruction: instruction)
    commands.append(command)
  }
  return commands
}

func parseMnemonic(rawMnemonic: String) -> Mnemonic {
  switch rawMnemonic {
  case "acc":
    return .acc
  case "jmp":
    return .jmp
  default:
    return .nop
  }
}

func parseInstruction(instruction: String) -> Int {
  return Int(instruction) ?? 0
}

let programStack = parseRawProgram()

func runProgram(program: [Command]) -> Int {
  var stackPointer = 0
  var registerA = 0
  while stackPointer <= program.count - 1 {
    let currentCommand = program[stackPointer]
    if currentCommand.shouldExit() {
      break
    }
    currentCommand.incExecutionCount()
    debugPrint(currentCommand.getMnemonic())
    switch currentCommand.getMnemonic() {
    case .acc:
      stackPointer += 1
      registerA += currentCommand.getAcumulator()
    case .jmp:
      stackPointer += currentCommand.getJumpCount()
    case .nop:
      stackPointer += 1
    }
  }
  return registerA
}

func runProgramv2(program: [Command]) -> (Int, Int) {
  var stackPointer = 0
  var registerA = 0
  while stackPointer <= program.count - 1 {
    let currentCommand = program[stackPointer]
    if currentCommand.shouldExit() {
      break
    }
    currentCommand.incExecutionCount()
    switch currentCommand.getMnemonic() {
    case .acc:
      stackPointer += 1
      registerA += currentCommand.getAcumulator()
    case .jmp:
      stackPointer += currentCommand.getJumpCount()
    case .nop:
      stackPointer += 1
    }
  }
  return (registerA, stackPointer)
}



func debugProgram(program: [Command]) {
  let programToRun = NSArray(array:program, copyItems: true) as! [Command]
  for (index, command) in program.enumerated()  {
    if command.getMnemonic() == .jmp {
      let replaceCommand = command.copy() as! Command
      replaceCommand.setMnemonic(mnemonic: .nop)
      var programToDebug = NSArray(array:programToRun, copyItems: true) as! [Command]
      programToDebug[index] = replaceCommand
      let (accValue, stackPointer) = runProgramv2(program: programToDebug)
      if stackPointer == program.count {
        debugPrint("Terminates")
        debugPrint(index)
        debugPrint(accValue)
        break
      }
    }
  }
}

debugProgram(program: programStack)
