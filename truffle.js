var fs = require("fs");

module.exports = {
  compilers: {
    solc: {
      settings: {
        optimizer: {
          enabled: true,
          runs: 10000
        }
      },
      version: "0.5.7"
    }
  },
  networks: {
    live: {
      host: "localhost",
      port: 8546,
      network_id: '1', // main-net
      gasPrice: 5000000000
    },
    testnet: {
      host: "localhost",
      port: 8545,
      network_id: '2', // main-net
      gasPrice: 21000000000
    },
    priv: {
      host: "13.231.176.170",
      port: 8545,
      network_id: '1', // main-net
      gasPrice: 5000000000,
      gas: 7500000
    },
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
      gasPrice: 21000000000,
      gas: 6700000
    },
    coverage: {
      host: "localhost",
      network_id: "*",
      port: 8555,         // <-- If you change this, also set the port option in .solcover.js.
      gas: 0xfffffffffff, // <-- Use this high gas value
      gasPrice: 0x01      // <-- Use this low gas price
    },
    docker: {
      host: "ganache",
      port: 8545,
      network_id: "*", // Match any network id
      gasPrice: 21000000000,
      gas: 6700000
    }
  }
};
