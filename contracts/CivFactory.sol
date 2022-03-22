pragma solidity ^0.8.0;

contract CivFactory {

  struct Player {
    uint id;
    string name;
    
  }

  constructor() public {
  }

  function deposit (uint amount) public {
    balance += amount;
  }

  function withdraw (uint amount) public {
    require(balance >= amount, "Account has insufficient funds");
    balance -= amount;
  }
}
