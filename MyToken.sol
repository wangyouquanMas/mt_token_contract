pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract MyToken is ERC20,Ownable,Pausable{
    constructor(uint256 initialSupply) ERC20("MyToken","MTK"){
        _mint(msg.sender,initialSupply);
    }

    //1. 支持增加供应量功能
    function mint(address to,uint256 amount) public onlyOwner{
        _mint(to,amount);
    }

    //2. 添加燃烧代币功能
    //目的：意味着从总供应量中减少一定数量的代币。通常，燃烧代币用于控制通胀或增加代币价值
    function burn(uint256 amount) public{
        _burn(msg.sender,amount);
    }

    //3. 暂停代币的交易
    function pause() public onlyOwner{
        _pause();
    }


    function unpause() public onlyOwner{
        _unpause();
    }

   function _beforeTokenTransfer(address from, address to, uint256 amount) internal whenNotPaused override {
        super._beforeTokenTransfer(from, to, amount);
    }

}