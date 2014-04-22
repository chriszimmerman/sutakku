Sutakku
==============

Sutakku is a press-your-luck dice game. This is a ruby implementation based off of a commercial
dice game with the same name, which is based off of a traditional Japanese dice game.

Information about the commerical game can be found at:

http://www.frpgames.com/cart.php?m=product_detail&p=75955#.U1Z-ZMfc2lg

Rules
--------------

The player rolls three dice. The player takes the two lowest dice that are greater than or
equal to the value of top die on the stack. If all of the dice are less than the value of
the top die, the player busts.

After each roll, the player has the choice to stop. If the player stops, the player's score
is calculated by multiplying the value of the top die by the number of dice on the stack.
For example, if you have a stack of three dice with six as the top value, then your score
is 18.


Starting The Game
--------------

In order to start the game, run the sutakku.rb ruby script:

	ruby sutakku.rb

This will start the game's loop. When the game starts, the player is prompted to enter
commands in order to play the game.

Commands
--------------
roll

Using the roll command rolls three dice (or just the remaining dice if there are less than three). 

look

Using the look command will show you the current stack of dice. The top of the stack is the uppermost
number and each number represents the value of the die rolled on the stack.

stop

The stop command stops the game. At this point, your score is calculated by multiplying the number
of dice on the stack by the value of the topmost die.
