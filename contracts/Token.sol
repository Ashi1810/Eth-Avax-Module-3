// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract MyToken {
    // Public variables
    string public Nameoftoken = "MyToken";
    string public SymbolofToken = "MT";
    uint public totalTokenSupply = 1000;

    // Mapping variable
    mapping (address => uint) public tokenBalances;

    // Event emitted when tokens are minted
    event TokensMinted(address indexed account, uint amount);

    // Event emitted when tokens are burned
    event TokensBurned(address indexed account, uint amount);

    // Mint function
    function mintTokens(address _address, uint _amount) public {
        totalTokenSupply += _amount;
        tokenBalances[_address] += _amount;
        emit TokensMinted(_address, _amount);
    }

    // Burn function
    function burnTokens(address _address, uint _amount) public {
        require(tokenBalances[_address] >= _amount, "Insufficient balance");
        totalTokenSupply -= _amount;
        tokenBalances[_address] -= _amount;
        emit TokensBurned(_address, _amount);
    }

    // Get balance of an address
    function getBalance(address _address) public view returns (uint) {
        return tokenBalances[_address];
    }

    // Transfer tokens from one address to another
    function transferTokens(address _from, address _to, uint _amount) public {
        require(tokenBalances[_from] >= _amount, "Insufficient balance");
        tokenBalances[_from] -= _amount;
        tokenBalances[_to] += _amount;
    }
}
