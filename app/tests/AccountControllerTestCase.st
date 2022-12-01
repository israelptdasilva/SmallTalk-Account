TestCase subclass: AccountControllerTestCase [
  | database |	
  | controller |	
  
  setUp [
    database := MockDatabase new.
    controller := AccountController new: database.
  ]

  testBalanceStartsZero [
    self assert: (controller getBalance == 0)
  ]

  testBalanceStatement [
    | statement |
    statement := controller getStatement.
    self assert: (statement > 0).
  ]

  testBalanceUpdatesOnDeposit [
    | amount newBalance |
    amount := 5.
    newBalance := (controller getBalance) + amount.
    controller deposit: amount. 
    self assert: (controller getBalance == newBalance)
  ]

  testBalanceDoesntUpdateOnDepositFail [
    | amount oldBalance |
    database setUpdateBalanceResult: 0.
    amount := 5.
    oldBalance := controller getBalance.
    controller deposit: amount. 
    self assert: (controller getBalance == oldBalance).
  ]

  testBalanceUpdatesOnWithdraw [
    | amount newBalance |
    amount := 5.
    newBalance := (controller getBalance) - amount.
    controller withdraw: amount.
    self assert: (controller getBalance == newBalance)  
  ]

  testBalanceDoesntUpdateOnWithdrawFail [
    | amount oldBalance newBalance |
    database setUpdateBalanceResult: 0.
    amount := 5.
    oldBalance := controller getBalance.
    controller withdraw: amount. 
    self assert: (controller getBalance == oldBalance).
  ]
]

(AccountControllerTestCase selector: #testBalanceStartsZero) run.
(AccountControllerTestCase selector: #testBalanceStatement) run.
(AccountControllerTestCase selector: #testBalanceUpdatesOnDeposit) run.
(AccountControllerTestCase selector: #testBalanceDoesntUpdateOnDepositFail) run.
(AccountControllerTestCase selector: #testBalanceUpdatesOnWithdraw) run.
(AccountControllerTestCase selector: #testBalanceDoesntUpdateOnWithdrawFail) run.
