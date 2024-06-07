import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const owner = process.env.INITIAL_OWNER_ADDRESS;

const MockSbtContractModule = buildModule("MockSbtContractModule", (m: any) => {
  const initialOwner = m.getParameter("initialOwner", owner);

  // Deploy the SbtContract contract and set the constructor arguments
  const mockSbtContract = m.contract("MockSbtNFT", [initialOwner]);

  return { mockSbtContract };
});

export default MockSbtContractModule;
