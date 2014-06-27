GamEXP Server
====================

This is a Rails app developed to implement the GamEXP model.

Whats GamEXP?
--------------------
You might have this question. Basically, it's a way to generate statistics based on which you may balance your game mechanics. Take a look at db/schema.rb for how this data is represented.

This model relies on players to create new configurations to the game as well as rate them.
The data is processed and collected by a server (such as this one here).

So, to implement the GamEXP you'll need:
- Players to test, tweak and evaluate;
- A server to handle the data;
- A game to experiment with.

Basic Setup
--------------------
To quickly setup the GamEXP, you should setup this server and a game to work with (here's one that does just that: https://github.com/arielbello/Keep-on-Track).

To setup the server you need to:
- Configure its secrets on config/secrets.yml;
- Set the db credentials on config/database.yml (The database used on this example is PostgreSQL, but you can use your prefered database adapter);
- Create your database and run rake db:migrate;
- Setup the db/seeds.rb with your base data. Here you need to create at least the game. Pay attention to the game's name, as you will need to setup the same on the client (the game itself).

With the server up and the game hooked up with it, the experiment can begin!

Last but not least, take your time reading and understanding the code (it's not good, I guarantee it).
If you need some support, mail me: arielfbello@gmail.com.

Credits
--------------------

###THE BEER-WARE LICENSE (Revision 42):
	<arielfbello@gmail.com> wrote this file. As long as you retain this notice you
	can do whatever you want with this stuff. If we meet some day, and you think
	this stuff is worth it, you can buy me a beer in return.