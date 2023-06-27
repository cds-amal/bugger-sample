// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

contract A {
    function foo() public pure returns (uint) {
        return 1;
    }
    
    fallback() external {
        // bytes memory bs = hex"abcabcab";
        bytes memory bs = hex"abcabcababcabcababcabcababcabcababcabcababcabcababcabcababcabcab";
        assembly {
            return(add(0x20, bs), mload(bs))
        }
    }
}

contract C {
    function main() public returns (uint x, uint y, uint z, uint w) {
        A a = new A();
        x = a.foo();
        (bool success, bytes memory data) = address(a).call("");
        y = abi.decode(data, (uint));
        // revert();
        (success, data) = address(a).call(abi.encodeWithSignature("foo()"));
        z = abi.decode(data, (uint));
        (success, data) = address(a).call(abi.encodeWithSelector(A.foo.selector));
        w = abi.decode(data, (uint));


        // a.code.length;
        // address(a).code.length;
        // assembly {
        //     staticcall(mygas, myaddr, ...)
        // }
    }
}
