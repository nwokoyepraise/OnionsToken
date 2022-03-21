// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OnionsInu is ERC20, Ownable {
    uint256 public rate = 1000;
    constructor() ERC20("OnionsInu", "ONI") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken (address receiver) public payable {
        uint256 amount = msg.value * rate;
        transfer(receiver, amount);
    }
}

