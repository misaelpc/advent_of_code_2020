
let expenses = Inputs.expenses
let sizeZeroBased = expenses.count - 1
var start = 0
var end = expenses.count - 1
var continueSearch = true

func expensesSearch() -> Int {
  while continueSearch {
    for index in stride(from: start, through: sizeZeroBased - 1, by: 1) {
      if expenses[start] + expenses[index + 1] == 2020 {
        continueSearch = false
        return expenses[start] * expenses[index + 1]
      }
    }
    
    if continueSearch == false {
      break
    }
                    
    for index in stride(from: sizeZeroBased - 1, through: 0, by: -1) {
      if expenses[end] + expenses[index] == 2020 {
        continueSearch = false
        return expenses[end] * expenses[index]
      }
    }
    start += 1
    end -= 1
    if start >= expenses.count || end == 0 {
      break
    }
  }
  return 0
}

expensesSearch()
