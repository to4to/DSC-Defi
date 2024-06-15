// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;


import {ERC20Burnable,ERC20} from "@openzippelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzippelin/contracts/access/Ownable.sol";

contract DecentralizedStableCoin is ERC20Burnable ,Ownable {

    error DecentralizedStableCoin_AmountMustBeMoreThanZer();
    error DecentralizedStableCoin_BurnAmountExceedsBalance();
    error DecentralizedStableCoin_NotZerAddress();

    constructor()ERC20("DecentralizedStableCoin","DSC"){}


    function burn(uint _amount)public override onlyOwner {
        uint256 balance=balanceOf(msg.sender);
        if (_amount<=0){
            revert DecentralizedStableCoin_AmountMustBeMoreThanZero();
        }

        if(balance<_amount){
            revert DecentralizedStableCoin_BurnAmountExceedsBalnace();
        }

        super.burn(_amount);
    }


    function mint(address _to,uint _amount) external onlyOwner returns(bool){

        if (_to==address(0)){
            revert DecentralizedStableCoin_NotZerAddress();
        }

        if (_amount<=0){
            revert DecentralizedStableCoin_AmountMustBeMoreThanZer();
        }

        _mint(_to,_amount);

        return true;
    }

    }
