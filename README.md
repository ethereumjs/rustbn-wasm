# SYNOPSIS 
Rust to Javascript/Webassembly compilation of [ethereum-bn128.rs](https://github.com/ewasm/ethereum-bn128.rs).

Derived largely from [rustbn.js](https://github.com/ethereumjs/rustbn.js) and recompiled used [`wasm-pack`](https://rustwasm.github.io/docs/wasm-pack/introduction.html)

Internally it uses the [Parity fork](https://github.com/paritytech/bn) of the [Zcash bn
pairing cryptography library](https://github.com/zcash/bn), implementing an efficient bilinear pairing on the Barreto-Naehrig (BN) curve. 

It implements helpers to support the functionality defined in [EIP-196](https://eips.ethereum.org/EIPS/eip-196) and [EIP-197](https://eips.ethereum.org/EIPS/eip-197).

## Installation

Clone this repo and build following the [Compilation] instructions below.

## Usage

Import the module:

```
import { ec_add, ec_mul, ec_pairing } from 'rustbn'
```

Curve Addition

```
let inputHexString = ...
let outputHexString = ec_add(inputHexString)
```

Curve Multiplication

```
let inputHexString = ...
let outputHexString = ec_mul(inputHexString)
```

Curve Pairing
```
let inputHexString = ...
let outputHexString = ec_pairing(inputHexString)
```

## Developer

### Compilation

Compilation process based on the [`wasm-pack`](https://rustwasm.github.io/docs/wasm-pack/introduction.html) docs.

For basic setup:
- Install `rust` and `wasm-pack` via the [`wasm-pack` prerequisites](https://rustwasm.github.io/docs/wasm-pack/prerequisites/index.html)
- Clone this repo
- Install JS dependencies - `npm i`
- Run `npm run build`


## License

Licensed under either of

 * MIT license, ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)

at your option.

Copyright 2016 [Zcash Electric Coin Company](https://z.cash/). The Zcash Company promises to maintain the "bn" crate on crates.io under this MIT/Apache-2.0 dual license.
 
