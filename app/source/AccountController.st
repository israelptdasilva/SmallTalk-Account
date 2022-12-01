Object subclass: AccountController [
  | database |
  | account |
  
  init [
    database := Database new.
    account := Account new. 
  ]

  init: newDatabase [
    database := newDatabase.
    account := Account new.
  ]

  getBalance [
    ^account balance 
  ]  

  getStatement [
    ^database getStatement.
  ]

  deposit: amount [
    | oldBalance newBalance result |
    oldBalance := account balance.
    newBalance := oldBalance + amount.
    result := database updateBalance: newBalance.
    (result > 0)
      ifTrue: [ 
        account updateBalance: newBalance.
      ]
  ]
	
  withdraw: amount [
    | oldBalance newBalance result |
    oldBalance := account balance.
    newBalance := oldBalance - amount.
    result := database updateBalance: newBalance.
    (result > 0)
      ifTrue: [ 
        account updateBalance: newBalance.
      ]
  ]
]

AccountController class extend [
  new [ ^super new init ]
  new: newDatabase [ ^super new init: newDatabase ]
]
