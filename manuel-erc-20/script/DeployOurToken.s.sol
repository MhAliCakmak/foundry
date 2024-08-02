// scripts/DeployOurToken.s.sol
import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        OurToken ourtoken = new OurToken();
        vm.stopBroadcast();
        // Incorrect attempt to access the address
        // return ourtoken.address;
        
        // Corrected line to obtain the contract address
        address ourTokenAddress = address(ourtoken);
        return ourTokenAddress;
    }
}
