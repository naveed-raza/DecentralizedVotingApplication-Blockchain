pragma solidity ^0.5.0;

contract Election {
   // string public candidate;       //by declaring it with public we can read and write as a function candidate()

    //Model the candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    
    //Store and fetch the candidate
    mapping(uint => Candidate) public candidates;

    //store the address who has voted
    mapping(address => bool) public voters;

    //Store candidates count
    uint public candidatesCount;

    //voteEvent
    event votedEvent(uint indexed _candidateId);


    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        //check whether address has been used or not and candidateID is valid
        require(!voters[msg.sender], "Address already have voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid Candidate ID");

        //increament votercount and mark address as voted
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        //calling vote event
        emit votedEvent(_candidateId);
    }
}