pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./GameHelper.sol";

contract MapFactory is Ownable, GameHelper {
  constructor () {
    //do nothing
  }

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
    Ocean,
    LENGTH
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
    Uranium,
    LENGTH
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
    Gate,
    LENGTH
  }

  struct Tile {
    TileType tileType;
    TileResource tileResource;
    TileImprovement TileImprovement;
  }

  Tile[] public mapTiles;

  mapping (uint8 => mapping ( uint8 => uint )) public coordToTile;
  mapping (uint => uint) public tileToCity;

    /**
    Generates a new map based on the passed size
    @param _xSize uint8: number of columns in the map
    @param _ySize uint8: number of rows in the map
   */
  function generateNewMap (uint8 _xSize, uint _ySize) internal onlyOwner {
    for (uint8 i = 0; i < _xSize; i++) {
      for (uint8 j = 0; j < _ySize; j++) {
        createNewRandomTile(i, j);
      }
    }
  }

  /**
   Creates a new tile based on a random hash
   @param col uint8: col of the coord map
   @param row uint8: row of the coord map

  */
  function createNewRandomTile (uint8 col, uint8 row) private onlyOwner {
    uint _tileType = random(uint(TileType.LENGTH));
    uint _tileResource = random(uint(TileResource.LENGTH));
    uint _tileImprovement = 0;
    mapTiles.push(Tile(TileType(_tileType), TileResource(_tileResource), TileImprovement(_tileImprovement)));
    uint tileId = mapTiles.length - 1;
    coordToTile[col][row] = tileId;
  }
}
