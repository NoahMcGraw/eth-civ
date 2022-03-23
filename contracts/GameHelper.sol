pragma solidity ^0.8.0;

contract GameHelper {
  uint nonce = 1;

  struct GameSession {
    string name;
    uint8 mapSizeX;
    uint8 mapSizeY;
    uint8 maxPlayers;
    uint8 playerCount;
  }

  GameSession public game;

  mapping(address => uint) playerToCiv;

  /**
  * Allows only players who do not have a civ already in the game to access the method.
  */
  modifier onlyNewPlayer () {
    require(playerToCiv[msg.sender] > 0);
    _;
  }

  function random(uint _upperLimit, uint _lowerLimit) internal returns (uint) {
    uint randomnumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, nonce))) % (_upperLimit - _lowerLimit);
    randomnumber = randomnumber + _lowerLimit;
    nonce++;
    return randomnumber;
  }

  function random(uint _upperLimit) internal returns (uint) {
    return random(_upperLimit, 0);
  }
}
