pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./ZombieFactory.sol";

contract ZombieFactoryTest is DSTest {
    ZombieFactory l;

    function setUp() public {
        l = new ZombieFactory();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
