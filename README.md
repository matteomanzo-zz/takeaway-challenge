#Take Away Challenge 
🚧 INCOMPLETE 🚧

##What is it?
A take-away shop. The customer makes an order and pays. If the payment is correct he will receive a text on his mobile.

![image](takeawaysign.jpg)

##Tasks

* Write a Takeaway program.
* Implement the following functionality:

  - list of dishes with prices.
  - placing the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not
  correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  - The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  - Use twilio-ruby gem to access the API.
  - Use a Gemfile to manage your gems.
  - Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run.
  - However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

##CRC

A MENU contains dishes with prices and a SHOP contains a MENU.
The CUSTOMER adds dishes to its basket indicating what dish, how many dishes, and how much it is going to pay.
The SHOP checks the order and, if the payment it's equal to the cost of the dishes it will send an SMS to the CUSTOMER, otherwise it will throw an error.

####Menu

Responsabilities  |  Collaborators
------------------|----------------
  Contain dishes  |	      -
  Contain prices  |       -
-----------------------------------

####Customer

Responsabilities  |  Collaborators
------------------|---------------
  Place an order  |  Shop, Menu
   Receive text   |	    Shop
----------------------------------

####Shop

Responsabilities  |  Collaborators
------------------|----------------
  Send a text     |	Customer, Text
  Check the total | Customer, Menu
-----------------------------------

####Text

Responsabilities  |  Collaborators
------------------|----------------
  Be sent         |	     Shop
-----------------------------------

##Still to complete/refactor

- [ ] Fix Order class
- [ ] Fix Cusomer class

##Technologies
- Ruby
- Twilio API

#####Testing
- RSpec
