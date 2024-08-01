//SPDX-License: Unlicensed

pragma solidity ^0.8.13;

/// @title Manuel Token
/// @author MhAliCakmak
/// @notice This contract for creating Manuel Token
contract ManuelToken {
    mapping(address => uint256) s_balances;
    function name() public pure returns (string memory) {
        return "Manuel Token";
    }

    function symbol() public pure returns (string memory) {
        return "MANUEL";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 1000000;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(s_balances[msg.sender] >= _value);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        return true;
    }  
}
