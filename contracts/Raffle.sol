// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//enter the lottery (pay some amount)
// pick a random winner (verifiably random)
//winner to be selected every X time -> completely automated
//chainlink oracle ->  randowmness, automated execution

error Raffle__NotEnoughETHEntered();

contract Raffle {
    /*State Variables*/
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event RaffleEnter(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        //Emit an event when we update a dyamic array or mapping
        emit RaffleEnter(msg.sender);
    }

    // function pickRandom()  returns () {

    // }

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
