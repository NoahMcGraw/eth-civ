pragma solidity ^0.8.0;

import "./MapFactory.sol";

contract CivFactory is MapFactory {

  struct Civilization {
    address owner;
    string name;
    uint16 age;
    string leader;
  }

  Civilization[] public civs;

  mapping (uint => uint) public cityToCiv;
  mapping (uint => uint) public civCityCount;


  constructor () {
    // do nothing
  }

  /**
    Creates a new civ for a player who is not already playing the game
    @param _name string: Name of the civ
    @param _leader string: Name of the civ's leader
   */
  function createNewCiv (string memory _name, string memory _leader) public onlyNewPlayer {
    require(game.playerCount + 1 <= game.maxPlayers);
    game.playerCount++;
    civs[game.playerCount] = Civilization(msg.sender, _name, 0, _leader);
    playerToCiv[msg.sender] = game.playerCount;
    // Spawn new hero with name of the leader and put them on the map.
  }

}
