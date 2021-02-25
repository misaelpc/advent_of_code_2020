import UIKit

let passports = Inputs.readFile()

var requiredFields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]

func validateFields(fields: [String.SubSequence]) -> Int {
  var founds = 0
  for field in fields {
    let infoField = field.split(separator: ":")
    let searchIndex = infoField.index(infoField.startIndex, offsetBy: 0)
    debugPrint(infoField[searchIndex])
    if requiredFields.contains(String(infoField[searchIndex])) {
      founds += 1
    }
  }
  return founds
}

var validPassports = 0
for passport in passports {
  let fields = passport.split(separator: " ")
  debugPrint(fields)
  if validateFields(fields: fields) == 7 {
    validPassports += 1
  }
}

debugPrint(validPassports)
