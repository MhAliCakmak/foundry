import "../src/EasyMath.sol";


contract ContractTest{
    EasyMath easyMath;
    constructor() {
        easyMath = new EasyMath();
    }

    function testMulMulMul() public view {
        uint256 a = 2;
        uint256 b = 3;
        uint256 c = 4;
        uint256 result = easyMath.mulMulMul(a, b, c);
        assert(result == 24);
    }

    function testFailMulMulMul() public view{
        uint256 a = 2;
        uint256 b = 3;
        uint256 c = 4;
        uint256 result = easyMath.mulMulMul(a, b, c);
        assert(result == 25);
    }

}