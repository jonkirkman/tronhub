part of tron_hub;

// Basic start-up and turn taking
class Game {
  String name;
  Arena arena;
  Set<Player> players;


  Game(String name, Set<Player> players) {
    this.name = name;
    this.players = players;
  }
  
  Set<Player> get activePlayers {
    return players.where( (p) => p.active );
  }

  /// Begin the game
  void start() {
    players.forEach( (p) {
      p.state = PlayerState.active;
    } );
    gameLoop();
  }

  /// Starts the game when all joined players are ready?
  void startWhenReady() {

  }

  void gameLoop() {
    // while we have active players
    while(activePlayers.length >= 1) {
      // give each players an opportunity to move
      print("hey");
    }
  }
}
