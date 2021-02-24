import UIKit
let forest = Inputs.originalForest
let singleForest = Inputs.readFile()

func multiplyForest(times: Int, singleForest: [String.SubSequence]) -> [String.SubSequence] {
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

let bigForest = multiplyForest(times: 81, singleForest: singleForest)

let left = 3
var leftOriginalPosition = -1
var foundedThrees = 0

for (index, row) in bigForest.enumerated() {
  if index == 0 {
    leftOriginalPosition += left
    continue
  }
  let searchIndex = row.index(row.startIndex, offsetBy: leftOriginalPosition + 1)
  let stopBeforeDownValue = row[searchIndex]
  if stopBeforeDownValue == "#" {
    foundedThrees += 1
  }
  leftOriginalPosition += left
}

debugPrint(foundedThrees)
