# TextMaster coding exercise
[![Build Status](https://travis-ci.org/merwan/testmaster.svg?branch=master)](https://travis-ci.org/merwan/textmaster)

From https://gist.github.com/textmaster/3fcc41e5e538dbb86947

___

_Please send a zip archive containing your code and any relevant materials in an email along with your resume and motivations to jobs@textmaster.com, please add tech-test@textmaster.com in CC.
The purpose of this test is to verify your abilities to code and see how you architecture an application, so this is the time to show everything you know that is applicable and relevant (design pattern, OOP concepts, etc.)
Finally, please note that even if you have questions about the test we will not answer them, do what you think is best._


TextMaster's quest for global domination has prompted us to open a supermarket - we sell only three products:

```
+--------------|--------------|---------+
| Product Code |     Name     |  Price  |
+--------------|--------------|---------+
|     FR1      |   Fruit tea  |  $3.11  |
|     AP1      |   Apple      |  $5.00  |
|     CF1      |   Coffee     | $11.23  |
+--------------|--------------|---------+
```

Our CEO is a big fan of buy-one-get-one-free offers and of fruit tea. He wants us to add a rule to do this.

The COO, though, likes low prices and wants people buying apple to get a price 
discount for bulk purchases. If you buy 3 or more apple, the price should drop to $4.50.
Our check-out can scan items in any order, and because the CEO and COO change 
their minds often, it needs to be flexible regarding our pricing rules.

The interface to our checkout looks like this (shown in Ruby):

```
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
```

Implement a checkout system that fulfils these requirements in Ruby.

Here are some test data:

```
Basket: FR1, AP1, FR1, CF1
Total price expected: $22.25
```

```
Basket: FR1, FR1
Total price expected: $3.11
```

```
Basket: AP1, AP1, FR1, AP1
Total price expected: $16.61
```

PS: Here at TextMaster, we love specs ;)
