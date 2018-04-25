pragma solidity ^0.4.21;

import './ContractOwned.sol';

contract HasAccess is ContractOwned {

    struct contractList {
        address contractAddress;
        string contractName;  
        bool contractActive;
        bool battleSolver;
        bool canKill;
        bool canRevive;
    }
    
    mapping(address => contractList) public contracts;
    
    function HasAccess () public {
        
    }
    
    function modifyContract(address _address, string _name, bool _active, bool _battleSolver, bool _canKill, bool _canRevive) public contract_onlyOwner returns (bool success) {
        contracts[_address].contractAddress = _address;
        contracts[_address].contractName = _name;
        contracts[_address].contractActive = _active;
        contracts[_address].battleSolver = _battleSolver;
        contracts[_address].canKill = _canKill;
        contracts[_address].canRevive = _canRevive;
        return true;
    }
    
    function queryAddress(address _address) public view returns (
        address _contractAddress, 
        string _contractName, 
        bool _isActive, 
        bool _isBattleSolver,
        bool _isCanKill,
        bool _isCanRevive
        ) {
        return (
            contracts[_address].contractAddress,
            contracts[_address].contractName,
            contracts[_address].contractActive,
            contracts[_address].battleSolver,
            contracts[_address].canKill,
            contracts[_address].canRevive
        );
    }
    
    function queryAddressActive(address _address) public view returns (bool success) {
        if (contracts[_address].contractActive == true) return true; else return false;
    }
    
    function queryAddressCanKill(address _address) public view returns (bool success) {
        if (contracts[_address].canKill == true) return true; else return false;
    }
    
    function queryAddressCanRevive(address _address) public view returns (bool success) {
        if (contracts[_address].canRevive == true) return true; else return false;
    }
    
    function queryAddressBattleSolver(address _address) public view returns (bool success) {
        if (contracts[_address].battleSolver == true) return true; else return false;
    }
}