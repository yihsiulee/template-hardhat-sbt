import hre from "hardhat";

const contractAddress = "0x473564d07dF72c8111a88A2Dd76E5E2c4cE6fab5";
const INITIAL_OWNER = process.env.INITIAL_OWNER_ADDRESS;

async function main() {
  /* Verify the contract after deploying */
  await hre.run("verify:verify", {
    address: contractAddress,
    constructorArguments: [INITIAL_OWNER],
  });
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
