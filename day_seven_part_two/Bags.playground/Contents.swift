import UIKit

let rules = Inputs.readFile()
let bagRepo = BagRepository.shared

func readRules(rules: [String.SubSequence]) {
  for lineRule in rules {
    var firstDivider = lineRule.split(separator: ",")
    let rootBag = readContainRule(rule: firstDivider[0])
    firstDivider.remove(at: 0)
    readReaminingRules(rootBag: rootBag, rules: firstDivider)
  }
}

func readReaminingRules(rootBag: Bag, rules: [Substring.SubSequence]) {
  for rule in rules {
    let (color, quantity) = readBagAttributes(rawBag: String(rule))
    bagRepo.attachBag(color: color, quantity: quantity, parentBag: rootBag)
  }
}

func readContainRule(rule: String.SubSequence) -> Bag {
  var bagRules = rule.components(separatedBy: "contain")
  let firstBagColor = bagRules[0].replacingOccurrences(of: "bags ", with: "").trimmingCharacters(in: .whitespaces)
  let bag = Bag(color: firstBagColor)
  bagRepo.addBag(color: firstBagColor, bag: bag)
  bagRules.remove(at: 0)
  let containing = bagRules[0].trimmingCharacters(in: .whitespaces)
  let (color, quantity) = readBagAttributes(rawBag: containing)
  bagRepo.attachBag(color: color, quantity: quantity, parentBag: bag)
  return bag
}

func readBagAttributes(rawBag: String) -> (String, Int) {
  let color = extractColor(rawBag: rawBag)
  let quantity = extractNumber(rawBag: rawBag)
  return (color, Int(quantity) ?? 0)
}

func extractColor(rawBag: String) -> String {
  let regex = try! NSRegularExpression(pattern: "bags|\\d|bag|\\.", options: NSRegularExpression.Options.caseInsensitive)
  let range = NSMakeRange(0, rawBag.count)
  let modString = regex.stringByReplacingMatches(in: rawBag, options: [], range: range, withTemplate: "")
  return modString.trimmingCharacters(in: .whitespaces)
}

func extractNumber(rawBag: String) -> String {
  let regex = try! NSRegularExpression(pattern: "[a-zA-Z]", options: NSRegularExpression.Options.caseInsensitive)
  let range = NSMakeRange(0, rawBag.count)
  let modString = regex.stringByReplacingMatches(in: rawBag, options: [], range: range, withTemplate: "")
  return modString.trimmingCharacters(in: .whitespaces)
}

readRules(rules: rules)

//bagRepo.parseContainingBags()
bagRepo.parseShinyPath()
