Object subclass: MockDatabase [
  | updateBalanceResult |

  init [
    updateBalanceResult := 1.
  ]

  setUpdateBalanceResult: value [
    updateBalanceResult := value.
  ]
 
  getStatement [
    ^1
  ]  

  updateBalance: amount [
    ^updateBalanceResult
  ]
]

MockDatabase class extend [
  new [ ^super new init ]
]

