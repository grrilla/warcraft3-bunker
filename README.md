Warcraft III Barracks Simulator - Enhancements
===============

## Exercise

Implement the following enhancements to the completed Warcraft III code. Write specs first and then implement the functionality.

Use the RSpec writing methodology from the weekend homework as reference or review it prior to starting, if you'd like.

Though it's not standard practice, for our learning purposes you can write each enhancement as a new testno.rb file. Remember to require the spechelper at the top. On that note, refer to the other similar specs to remember syntax and how they are implemented.

Below are the list of enhancements you will be making to the Warcraft III code. Please do them in order.

## Enhancement 1

In most strategy games, like Warcraft III, buildings can also be attacked by Units. Since a Barracks is a building, it has substantially more HP (500). Additionally, a Footman does only half of its AP as damage to a Barracks. This is because they are quite ineffective against buildings.

The damage amount should be an integer (Fixnum), but the ceiling (ceil) of the division should be used as the resulting amount.

## Enhancement 2

Units start off alive but they die if their HP reaches 0 or lower. This is usually a result of receiving damage from combat.

### Part 1

Define a method #dead? on the Unit class. We add it to Unit instead of Footman because all Units can die, not just Footmans or Peasants.

### Part 2

A dead Unit cannot attack another Unit. Conversely, a living Unit will also not attack another Unit that is already dead.

## Enhancement 3

Introduce a SiegeEngine Unit.

### Part 1

SiegeEngines will require lumber when built by a Barracks. Besides food and gold, Barracks therefore also need to have a lumber resource.

A Barracks starts off with 500 lumber.

### Part 2

The SiegeEngine is very effective against buildings such as the Barracks. However, it is ineffective against other Units. (It can't attack them, as if they were dead.)

So unlike with Footman (whose attacks do a fraction of the damage they normally would), a SiegeEngine does 2× damage against a Barracks.

Also, SiegeEngines can attack other SiegeEngines even though they cannot attack any other Units (such as Peasants or Footmans.)

SiegeEngines are initialized with the following stats.

AP: 50
HP: 400
Cost: 200 gold, 60 lumber, 3 food
Make note, you will need to require the siege_engine.rb file in spec_helper.rb.
