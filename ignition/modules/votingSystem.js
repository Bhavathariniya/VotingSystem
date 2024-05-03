const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



module.exports = buildModule("voterSystemModule", (m) => {
  const voter=m.contract("VotingSystem");

  

  return { voter};
});
