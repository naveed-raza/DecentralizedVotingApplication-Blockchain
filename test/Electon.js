var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {

    var electionInstance;

    it("Election", function(){
        return Election.deployed().then(function(instance){
            return instance.candidatesCount();
        }).then(function(count){
            assert.equal(count, 2);
        });
    });


    it("Everything is initialized with correct values", function(){
        return Election.deployed().then(function(instance){
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate[0], 1, "Correct ID");
            assert.equal(candidate[1], "Candidate 1", "Correct name");
            assert.equal(candidate[2], 0, "Correct vote count");

            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0], 2, "Correct ID");
            assert.equal(candidate[1], "Candidate 2", "Correct name");
            assert.equal(candidate[2], 0, "Correct vote count");
        });
    });

});