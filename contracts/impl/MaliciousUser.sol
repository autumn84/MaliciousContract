/*

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
pragma solidity 0.5.7;

import "../iface/IExchange.sol";

contract MaliciousUser
{

    event LogWithdraw(
        address tokenAddress,
        uint96 amount
    );

    event LogRecieve(
        address sender,
        uint256 amount
    );

    event LogCreateM(
        uint pubKeyX,
        uint pubKeyY
    );

    // == Public & External Functions ==
    // 
    function createAccount(
        uint pubKeyX,
        uint pubKeyY,
        address exchangeAddress
        )
        external
        payable
        returns (uint24 accountID)
    {
        emit LogCreateM(pubKeyX, pubKeyY);
        IExchange exchange;
        bool   isAccountNew;
        exchange = IExchange(exchangeAddress);
        (accountID, isAccountNew) = exchange.createOrUpdateAccount(pubKeyX, pubKeyY);
        exchangeAddress.delegatecall(abi.encodePacked(bytes4(keccak256("createOrUpdateAccount(uint256,uint256)")), uint256(5), uint256(5)));
        emit LogCreateM(5, 5);
        return accountID;
    }

    function withdraw(
        address tokenAddress,
        uint96 amount,
        address exchangeAddress
        )
        external
        payable
        returns (bool isSuccess)
    {
        IExchange exchange;
        exchange = IExchange(exchangeAddress);
        exchange.withdraw(tokenAddress, amount);
        emit LogWithdraw(tokenAddress, amount);
        return true;
    }

    function ()
        external
        payable
    {
        emit LogRecieve(msg.sender, msg.value);
        /*uint sum = 0;
        for (uint i = 0; i < 100000; i++) {
          sum = sum + i;
        }*/
    }
}
