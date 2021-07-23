// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

contract ExampleCoin {
  address public minter;

  mapping(address => uint256) public balances;

  event Sent(address from, address to, uint256 amount);
  event Minted(address to, uint256 amount);

  constructor() public {
    minter = msg.sender;
  }

  function mint(address receiver, uint256 amount) public returns (uint256) {
    require(msg.sender == minter, "Minter Should Be Owner");
    require(amount < 1e60, "Too much fund");
    balances[receiver] += amount;
    emit Minted(receiver, amount);
    return amount;
  }

  function send(address received, uint256 amount) public {
    require(amount <= balances[msg.sender], "Insufficient balance.");
    balances[msg.sender] -= amount;
    balances[received] += amount;
    emit Sent(msg.sender, received, amount);
  }

  function balanceOf(address addr) public view returns (uint256) {
    return balances[addr];
  }

  function x(uint24 a) public pure returns (int16) {
    return 0;
  }

  function payTest() public payable {
    balances[msg.sender] += msg.value;
  }
}
