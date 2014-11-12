part of tron_hub;

// Basic start-up and turn taking
class Game {
  Arena arena;
  List<Player> players;

  Game(Arena arena, List<Player> players) {
    this.arena = arena;
    this.players = players;

    gameLoop();
  }

  List<Player> get activePlayers {
    return players.where( (p) => p.active );
  }

  void gameLoop() {
    // while we have active players
    while(activePlayers.length >= 1) {
      // give each players an opportunity to move
      print("hey");
    }
  }
}
