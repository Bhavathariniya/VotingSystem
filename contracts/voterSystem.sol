// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Party {
        address id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Party) partyMembers;
    string[] partyNames;
    uint256 partyCount = 1;

    mapping(address => bool) voted;

    function partyRegister(string memory _name) public {
        uint256 voteCount = 0;
        partyMembers[partyCount] = Party(msg.sender, _name, voteCount);
        partyNames.push(_name);
        partyCount++;
    }

     function participants() public view returns(string[] memory){
        return partyNames;
    }

    function voteForParty(uint256 partyIndex) public {
        require(!voted[msg.sender], "You have already voted");
        require(partyIndex < partyCount, "Invalid party index");
        voted[msg.sender] = true;
        partyMembers[partyIndex].voteCount++;
    }

    function getWinnerParty() public view returns (string memory) {
        uint256 maxVotes = 0;
        string memory winningPartyName;

        for (uint256 i = 1; i < partyCount; i++) {
            if (partyMembers[i].voteCount > maxVotes) {
                maxVotes = partyMembers[i].voteCount;
                winningPartyName = partyMembers[i].name;
            }
        }

        return winningPartyName;
    }
}
