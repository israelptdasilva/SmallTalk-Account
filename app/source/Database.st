PackageLoader fileInPackages: #('DBD-MySQL').

Object subclass: Database [
  | connection |
  
  init [ 
    self connect.
  ]

  init: newConnection [
    connection := newConnection.
  ]

  connect [
    connection := DBI.Connection 
      connect: 'dbi:MySQL:dbname=account;hostname=mysql-host' 
      user: 'root' 
      password: 'root'.
  ]

  getStatement [
    | query result |
    query := 'select * from account'.
    result := connection select: query.
    ^result
  ]

  updateBalance: amount [
    | query result |
    query := 'insert into account (balance) values (', amount asString, ')'.
    result := connection do: query.
    ^result rowsAffected 
  ]
]

Database class extend [
  new [ ^super new init ]
  new: newConnection [ ^super new init: newConnection ]
]
