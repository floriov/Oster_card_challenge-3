# Oyster_card_challenge-3

### User Story #1

In order to use public transport As a customer I want money on my card

### User Story #2

In order to keep using public transport As a customer I want to add money to my card

add method to 'top_up' to oystercard
User Story #3

In order to protect my money from theft or loss As a customer I want a maximum limit (of £90) on my card

max limit of £90

### User Story #4

In order to pay for my journey As a customer I need my fare deducted from my card

method deduct = balance - fare

### User Story #5

In order to get through the barriers. As a customer I need to touch in and out.

method touch_in creates an instance of oystercard
method touch_out checks that that same instance of oystercard touches out
method in_journey? is a boolean - is true if customer has not touched out, but has touched in

### User Story #6

In order to pay for my journey As a customer I need to have the minimum amount (£1) for a single journey.

create constant of MINIMUM_AMOUNT
set MINIMUM_AMOUNT = 1

### User Story #7 
In order to pay for my journey As a customer When my journey is complete, I need the correct amount deducted from my card

fare deducted from oystercard when it touches out
