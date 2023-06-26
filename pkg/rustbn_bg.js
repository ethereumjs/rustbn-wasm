let wasm;
export function __wbg_set_wasm(val) {
    wasm = val;
}

/**
* @param {number} input_hex_ptr
* @returns {number}
*/
export function ec_mul(input_hex_ptr) {
    const ret = wasm.ec_mul(input_hex_ptr);
    return ret;
}

/**
* @param {number} input_hex_ptr
* @returns {number}
*/
export function ec_add(input_hex_ptr) {
    const ret = wasm.ec_add(input_hex_ptr);
    return ret;
}

/**
* @param {number} input_hex_ptr
* @returns {number}
*/
export function ec_pairing(input_hex_ptr) {
    const ret = wasm.ec_pairing(input_hex_ptr);
    return ret;
}

