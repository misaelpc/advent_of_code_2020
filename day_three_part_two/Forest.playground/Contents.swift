import UIKit

let singleForest = Inputs.readFile()
let bigForest = Inputs.multiplyForest(times: 120, singleForest: singleForest)

func countThreesOnJourney(moveLeft: Int, down: Int) -> Int{
  var leftOriginalPosition = -1
  var foundedThrees = 0
  for (index, row) in bigForest.enumerated() {
    if index == 0 {
      leftOriginalPosition += moveLeft
      continue
    }
    if index % down == 0 {
      let searchIndex = row.index(row.startIndex, offsetBy: leftOriginalPosition + 1)
      let stopBeforeDownValue = row[searchIndex]
      if stopBeforeDownValue == "#" {
        foundedThrees += 1
      }
      leftOriginalPosition += moveLeft
    }
  }
  return foundedThrees
}

func countMultipleJourneys() -> Int {
  let one = countThreesOnJourney(moveLeft: 1, down: 1)
  let two = countThreesOnJourney(moveLeft: 3, down: 1)
  let three = countThreesOnJourney(moveLeft: 5, down: 1)
  let four = countThreesOnJourney(moveLeft: 7, down: 1)
  let five = countThreesOnJourney(moveLeft: 1, down: 2)
  return one * two * three * four * five
}

debugPrint(countMultipleJourneys())
