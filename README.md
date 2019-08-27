[![Build Status](https://travis-ci.com/rachjgriff/bank.svg?branch=master)](https://travis-ci.com/rachjgriff/bank)

# RACHEL GRIFFITHS: BANK CHALLENGE
----------
## PROJECT DESCRIPTION
----------
* Wk 10 Makers Tech Test Challenge
* Banking application to be accessed via a REPL (irb)
* User can make deposits and withdrawals, and print an up to date account statement.

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
* To run in irb, follow the below instructions:

![bank_irb_example](images/bank_irb_example_update_4.png)

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
* Class BankAccount
  * Initialize with:
    * @balance = 0
    * @transactions_history = []
* Methods:
  * deposit(date: , credit: )
  * withdrawal(date: , debit: )
  * record_transaction
  * bank_statement
* Actions:
  * Update balance
  * Store all transactions
  * Print transactions in above format and in reverse chronological order
* Assumptions:
  * Date, credit & debit are entered
  * Date is a string

##### QUESTIONS/THOUGHTS
* Can the client make more than one deposit or withdrawal a day?
  * If so, should the credit and debit amounts sum these for that day?
  * Or can there be more than one entry for the same date?

## USER STORIES
---------

As a new bank account holder  
So that I can open a bank account  
I have a zero balance

As a new bank account holder  
So that I can open a bank account  
I have made no transaction history

As a bank account holder    
So that I can save for a holiday  
I can deposit money into my bank account

As a bank account holder  
So that I can buy lots of nice clothes for my holiday  
I can withdraw money from my bank account

As bank account holder  
So that I can ensure my bank account has been updated correctly  
I can store my transactions

As a bank account holder  
So that I can see how my balance is changing over time  
I can see my transaction history

As a bank account holder  
So that I can see how my current balance at the top of my bank statement  
I can see my most recent transaction first

As a bank account holder  
So that I can control my excessive spending  
I can not withdraw money if my balance is < 0

## REFACTOR APPROACH
--------
- [X] Move bank_statement method to its own class, BankStatement
- [X] Move transactions within deposit and withdrawal methods to private methods
- [X] Move balance and transaction to a new class
- [X] Do not allow account balance to go below 0
- [ ] Lines under 80 characters
- [X] Add in time.now and timecop
- [ ] Reduce BankBalance class to 30 lines Max
- [ ] Reduce methods to fewer than 5 lines
- [X] Add end-to-end test
- [ ] Add feature tests to test:
  - deposits & withdrawals
  - transactions
  - statement
- [X] Review for testing behaviour NOT state

## FOLLOW UP
--------
* Look into further opportunities for splitting classes further - possibly transaction_history
* Remove return nil from print statement method
* Remove Rubocop offenses

## WORKSHOP NOTES
---------
##### TESTING BEHAVIOUR NOTES
- testing what a method returns is testing behaviour
- some methods update instance variables which are not returning anything - if you test that the variable has updated then this is testing state - e.g. balance within deposit and withdrawal
- in this case you need to find another method that returns something that uses the instance variable to check it has worked
- if you're adding in an attr_reader just to test a variable, this is likely to be wrong
- good practice is that a method should only return one 'type' e.g. integer, string or boolean
- the main thing to keep in mind about testing behaviour vs state is that testing behaviour is testing what the method returns and checking it behaves as you expect.
- If the method does not return anything then often a test for that method will be stateful.
- The only way around this is to get the method to actually *return something* or to have another method which also tests that method as I mentioned.
