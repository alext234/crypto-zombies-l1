pragma solidity ^0.4.19;


contract ZombieFactoryEvents {
    event NewZombie(uint zombieId, string name, uint dna);
}


contract ZombieFactory is ZombieFactoryEvents {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie{
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private{
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint){
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public{
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    function getZombiesCount() public view returns (uint){
        return zombies.length;
    }

    function getDnaByIndex(uint idx) public view returns (uint){
        return zombies[idx].dna;
    }
}


