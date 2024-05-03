require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    hardhat:{},
    sepolia:{
      url:"https://sepolia.infura.io/v3/15fff117a5534e0981333a1d58820979",
      accounts:[process.env.PRIVATE_KEY]
    }
  }
};
