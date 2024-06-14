// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

//import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggeratorV3Interface.sol";

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library OracleLin {
    
error OracleLib_StalePrice();

    uint private constant TIOMEOUT=3 hours;


    function staleCheckLatestRoundData(AggregatorV3Interface chainlinkFeed) public view  returns (uint80 ,uint256,uint256,uint256,uint80) {
        




        (uint80 roundId,uint256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound)=chainlink.latestRoundData();
    }



}