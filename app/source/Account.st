Object subclass: Account [	
  | balance |
  
  init [ 
    balance := 0.
  ]

  balance [
    ^balance
  ]

  updateBalance: amount [
    balance := amount. 
  ]
]

Account class extend [
  new [ ^super new init ]
]
