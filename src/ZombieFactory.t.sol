pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./ZombieFactory.sol";

contract ZombieFactoryTest is DSTest {
    ZombieFactory factory;

    function setUp() public {
        factory = new ZombieFactory();
    }


    function test_createRandomZombie() public {
        assertEq( factory.getZombiesCount(), 0);
        factory.createRandomZombie("a");
        assertEq( factory.getZombiesCount(), 1);
        factory.createRandomZombie("b");
        assertEq( factory.getZombiesCount(), 2);
       
        uint aDna = factory.getDnaByIndex(0);
        uint bDna = factory.getDnaByIndex(1);
        
        // different names should lead to different DNAs
        assert( bDna != aDna );
    }

}
