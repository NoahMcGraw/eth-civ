pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract CivFactory is Ownable {

  using SafeMath for uint256;

  struct GameSession {
    string name;
    uint8 mapSize;
    uint8 maxPlayers;
    uint8 playerCount;
  }

  mapping(address => uint) playerToCiv;

  GameSession public game;

  struct Civilization {
    address owner;
    string name;
    uint16 age;
    string leader;
  }

  Civilization[] public civs;

  mapping (uint => uint) public cityToCiv;
  mapping (uint => uint) public civCityCount;

  enum TileType {
    Plains,
    Grassland,
    Desert,
    Tundra,
    Snow,
    PlainsHills,
    GrasslandHills,
    DesertHills,
    TundraHills,
    SnowHills,
    PlainsMountains,
    GrasslandMountains,
    DesertMountains,
    TundraMountains,
    SnowMountains,
    Coast,
    Ocean
  }

  enum TileResource {
    Wheat,
    Rice,
    Corn,
    Cows,
    Sheep,
    Horses,
    Stone,
    Copper,
    Iron,
    Coal,
    Niter,
    Oil,
    Uranium
  }

  enum TileImprovement {
    Farm,
    Pasture,
    Camp,
    Plantation,
    Quarry,
    Mine,
    Outpost,
    Village,
    Wall,
    Gate
  }

  struct Tile {
    TileType tileType;
    TileResource tileResource;
    TileImprovement TileImprovement;
  }

  Tile[] public mapTiles;

  mapping (uint8 => mapping ( uint8 => uint )) public coordToTile;
  mapping (uint => uint) public tileToCity;
  mapping (uint => uint) cityTileCount;


  struct City {
    string name;
    uint level;
  }

  City[] public cities;

  mapping (uint => address) public cityToPlayer;
  mapping (address => uint) playerCityCount;
  mapping (uint => uint) cityToTile;

  function createNewGame (string memory _name, uint8 _mapSize, uint8 _maxPlayers) private onlyOwner {
    game = GameSession(_name, _mapSize, _maxPlayers, 0);
  }

  constructor(string memory _name, uint8 _mapSize, uint8 _maxPlayers) {
    require(msg.sender == owner());
    createNewGame(_name, _mapSize, _maxPlayers);
  }

}
