pragma solidity ^0.4.4;
import "./Ownable.sol";
import "./StandardToken.sol";

contract InvestorsFeature is Ownable, StandardToken {
    using SafeMath for uint;
    
    address[] public investors;
    mapping(address => bool) isInvestor;
    function deposit(address investor, uint) internal {
        if(isInvestor[investor] == false) {
            investors.push(investor);
            isInvestor[investor] = true;
        }
    }
    
    function sendp(address addr, uint amount) internal {
        require(addr != address(0));
        require(amount > 0);
        deposit(addr, amount);
        
        // SafeMath.sub will throw if there is not enough balance.
        balances[this] = balances[this].sub(amount);
        balances[addr] = balances[addr].add(amount);
        Transfer(this, addr, amount);
    }
    


}