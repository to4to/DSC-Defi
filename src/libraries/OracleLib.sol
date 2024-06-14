// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

//import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggeratorV3Interface.sol";

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library OracleLin {
    
error OracleLib_StalePrice();

    uint private constant TIMEOUT=3 hours;


    function staleCheckLatestRoundData(AggregatorV3Interface chainlinkFeed) 
    public
     view 
     returns (uint80 ,int256,uint256,uint256,uint80) {

        (uint80 roundId,int256 answer,uint256 startedAt,uint256 updatedAt,uint80 answeredInRound)=
        chainlinkFeed.latestRoundData();


        if (updatedAt==0|| roundId<answeredInRound){
               revert OracleLib_StalePrice();
             }

uint256  updateTime=block.timestamp-updatedAt;
if(updateTime>TIMEOUT){
    revert OracleLib_StalePrice();
}
return (roundId,answer,startedAt,updatedAt,answeredInRound);
    }
     
function getTimeut(AggregatorV3Interface /* chainlinkfeed not used as of now */)public pure returns (uint256){

    return TIMEOUT;
}

}