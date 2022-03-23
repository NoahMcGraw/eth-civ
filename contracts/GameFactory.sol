pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./CityFactory.sol";

contract GameFactory is CityFactory {

  using SafeMath for uint256;

  mapping (uint => uint) cityTileCount;


  struct City {
    string name;
    uint level;
  }

  City[] public cities;

  mapping (uint => address) public cityToPlayer;
  mapping (address => uint) playerCityCount;
  mapping (uint => uint) cityToTile;

  /**
    Inits a new game to be played
    @param _name string: Name of the game session.
    @param _mapSizeX uint8: Total number of columns on the map
    @param _mapSizeY uint8: Total number of rows on the map
    @param _maxPlayers uint8: Maximum number of players allowed on the map
  */
  function createNewGame (string memory _name, uint8 _mapSizeX, uint8 _mapSizeY, uint8 _maxPlayers) private onlyOwner {
    game = GameSession(_name, _mapSizeX, _mapSizeY, _maxPlayers, 0);
    generateNewMap(_mapSizeX, _mapSizeY);
  }

  constructor(string memory _name, uint8 _mapSizeX, uint8 _mapSizeY, uint8 _maxPlayers) {
    // require(msg.sender == owner());
    createNewGame(_name, _mapSizeX, _mapSizeY, _maxPlayers);
  }

}
