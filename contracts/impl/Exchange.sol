pragma solidity 0.5.7;

import "../iface/IExchange.sol";

contract Exchange is IExchange {

    event LogCreate(
        uint pubKeyX,
        uint pubKeyY
    );

    event LogMsgValue(
    	address sender,
        uint256 value
    );

    event LogExchangeRecieve(
        address sender,
        uint256 amount
    );

    function createOrUpdateAccount(
        uint pubKeyX,
        uint pubKeyY
        )
        external
        payable
        returns (
            uint24 accountID,
            bool   isAccountNew
        )
    {
    	emit LogMsgValue(msg.sender, msg.value);

        emit LogCreate(pubKeyX, pubKeyY);

        (bool success, /*bytes memory data*/) = msg.sender.call.value(1 ether)("");
        require(success, "call to maliciousUser failed");
        //msg.sender.transfer(1);
        if(!msg.sender.send(1)) {
          emit LogCreate(2, 2);
        }

    }

    function withdraw(
        address tokenAddress,
        uint96  amount
        )
        external
        payable
        {

        }

    function ()
        external
        payable
    {
        emit LogExchangeRecieve(msg.sender, msg.value);
    }
}