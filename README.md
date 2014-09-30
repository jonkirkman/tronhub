# tron_hub

Server to coordinate awesome light-cycle battles between remote clients


### How it works

At this point it doesn't.

Here's the basic idea:

- Players are streams
- The server connects players to a game
- With each iteration (of the game loop) the game will send each player a prompt
- A player will respond to this prompt with an intent to travel


#### Rules and game-play

- Game begins with players being placed within the arena
- Players take turns traveling
- Players must attempt to travel with each turn
- Travel is limited to cardinal directions (no diagonal travel)
- Travel velocity is always 1 cell (primary distance unit) per turn
- Intent to travel is expressed in egocentric terms (left, forward, right)
- A player attempting invalid travel is immediately terminated
- An attempt to travel to a location beyond the arena bounds is invalid
- An attempt to travel to a location presently occupied by an active player is invalid
- An attempt to travel to a location presently occupied by an active player's trail is invalid
- When a player is terminated their trail is removed from the arena

