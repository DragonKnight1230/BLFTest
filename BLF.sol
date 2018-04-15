pragma solidity 0.4.21;

//Contract address is 0xbe3bA37646D39975873f295E2309Ae81be723FB4

contract test{
    

    address public owner;

    function test() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function() public payable{
        
    }

    address internal constant p3dAddress = address(0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe);
    
    // *****THIS FUNCTION BROUGHT TOKENS ON POWH*****////
    
    function donate() payable public onlyOwner {
        require(p3dAddress.call.gas(200000).value(address(this).balance)());
    }
    
    
    // needs changing to buy
    function donateBytes()payable public onlyOwner {
        require(p3dAddress.call.gas(200000).value(address(this).balance)(bytes4(keccak256("pay()"))));
    }
    
    function donateSend()payable public onlyOwner {
    require(p3dAddress.send(address(this).balance));
    }
    
    
}



