pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./ZombieFactory.sol";

contract ZombieFactoryTest is DSTest, ZombieFactoryEvents {
    ZombieFactory factory;

    function setUp() public {
        factory = new ZombieFactory();
    }


    function test_createRandomZombie() public {
        expectEventsExact(factory);
        
        assertEq( factory.getZombiesCount(), 0);
        factory.createRandomZombie("a");        
        assertEq( factory.getZombiesCount(), 1);
        // check for event
        NewZombie(0, "a", factory.getDnaByIndex(0));

        factory.createRandomZombie("b");        
        assertEq( factory.getZombiesCount(), 2);
        // check for event
        NewZombie(1, "b", factory.getDnaByIndex(1));
       
        uint aDna = factory.getDnaByIndex(0);
        uint bDna = factory.getDnaByIndex(1);
        
        // different names should lead to different DNAs
        assert( bDna != aDna );
    }

}
