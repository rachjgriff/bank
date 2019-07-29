# RACHEL GRIFFITHS: BANK CHALLENGE
----------
## PROJECT DESCRIPTION
----------
* Wk 10 Makers Tech Test Challenge
* Banking application to be accessed via a REPL
* User can make deposits and withdrawals, and access an up to date account statement.

## TECHNOLOGY
---------
* GitHub - Version Control
* Ruby 2.6.3 - Language
* RSpec - Testing Framework
* Rubocop - Linter
* SimpleCov - Test Coverage
* Travis - Continuous Integration

## INSTALLATION
---------
```
git clone git@github.com:rachjgriff/bank.git

bundle
```

## TESTING
---------
```
rspec

rubocop
```

## INSTRUCTIONS
---------

## REQUIREMENTS
---------
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## ACCEPTANCE CRITERIA
---------
* **Given** a client makes a deposit of 1000 on 10-01-2012
* **And** a deposit of 2000 on 13-01-2012
* **And** a withdrawal of 500 on 14-01-2012
* **When** she prints her bank statement
* **Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## APPROACH & STRATEGY
---------
* 2 classes: BankMachine, BankStatement
* Methods:
  * deposit
  * withdrawal
  * balance
  * statement
* Store transactions in a hash: { date => [credit, debit, balance] }

##### QUESTIONS/THOUGHTS
* How do I set date as the key in transactions hash?
* Should transactions be a method?
* How do i link the 2 classes?
* Need to ensure that **credit** is left blank if only a **withdrawal** is made
* Need to ensure that **debit** is left blank if only a **deposit** is made
* Is the client allowed to have a negative balance and continue to make withdrawals?


## USER STORIES
---------
