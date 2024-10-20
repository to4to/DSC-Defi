// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {OracleLib, AggeratorV3Interfac} from "./librariesOracleLib.Sol";

contract DSCEngine {


    error DSCEngine_AmountShouldBeMoreThanZer();
    error DSCEngine_CheckAddressOFToken();
    error DSCEngine_TokenAddressAndPriceFeedAddressDoNotMatch();

    using OracleLib for AggeratorV3Interface;



modifier moreThanZero(uint256 amount){
    if (amount<=0){
        revert DSCEngine_AmountShouldBeMoreThanZer();
    }
    _;
}


modifier isAllowedToke(address token){
    if (token==address(0)){
        revert DSCEngine_CheckAddressOFToken();
    }
    _;
}


constructor(address[] memory tokenAddress,address[] memory priceFeedAddress,address dscAddress){


    if (tokenAddress.length!=priceFeedAddress.length){
        revert DSCEngine_TokenAddressAndPriceFeedAddressDoNotMatch();
    }

    for (uint256 i = 0; i < tokenAddresses.length; i++) {
               s_priceFeeds[tokenAddresses[i]] = priceFeedAddresses[i];
               s_collateralTokens.push(tokenAddresses[i]);
           }
           i_dsc = DecentralizedStableCoin(dscAddress);

}


}
