const Exchange = artifacts.require("Exchange");
const MaliciousUser = artifacts.require("MaliciousUser");

contract("MaliciousUser", async (accounts) => {
  let exchange;
  let maliciousUser;

  before(async () => {
    exchange = await Exchange.deployed();
    maliciousUser = await MaliciousUser.deployed();
  });

  it("should transfer eth to maliciousUser", async () => {
     //console.log(maliciousUser)
     await maliciousUser.sendTransaction({ value: 1e+18, from: accounts[0] })
     let balance1 = await web3.eth.getBalance(maliciousUser.address);
     console.log(balance1);

     await maliciousUser.send(10, {from: accounts[0]});
     let balance2 = await web3.eth.getBalance(maliciousUser.address);
     console.log(balance2);

     await exchange.send(2e+18, {from: accounts[0]});
     let balanceExchange = await web3.eth.getBalance(maliciousUser.address);
     console.log(balanceExchange);

     console.log(exchange.address);
     let balanceAccount0 = await web3.eth.getBalance(accounts[0]);
     console.log(balanceAccount0);
     const result = await maliciousUser.createAccount(1, 1, exchange.address, {from: accounts[0], value: 2e18});
     //console.log(result);

     let balanceMaliciousUser = await web3.eth.getBalance(maliciousUser.address);
     console.log(maliciousUser.address);
     console.log(balanceMaliciousUser);
     console.log("account0: " + accounts[0]);

  });

});