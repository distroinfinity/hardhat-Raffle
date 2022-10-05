// Enter Lottery
// Pick a random winner
// Select winner at every X minutes
 // Cheinlink oracle - random number
 // chainlink keepr - trigger events

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error Raffle__NotEnoughETHEntered();

contract Raffle{
    // State Variables
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    // events
    event RaffleEnter(address indexed player);

    constructor(uint256 entryFee){
        i_entranceFee = entryFee;
    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee){ revert Raffle__NotEnoughETHEntered();}
        s_players.push(payable(msg.sender));
        // emit an event when we update a dynamic array or mapping
        emit RaffleEnter(msg.sender);

    }

    function getEntranceFee() public view returns(uint256){
        return i_entranceFee;
    }

    function getPlayers(uint256 index) public view returns(address){
        return s_players[index];
    }

    // function pickRandomWinner() private {};
}