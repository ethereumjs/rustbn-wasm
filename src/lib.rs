use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);
}

extern crate ethereum_bn128;
extern crate rustc_hex;

use rustc_hex::FromHex;
use rustc_hex::ToHex;


#[wasm_bindgen]
pub fn ec_mul(input_hex: String) -> String {
    let input_parsed = FromHex::from_hex(&*input_hex).unwrap();

    let mut output = [0u8; 64];
    match ethereum_bn128::bn128_mul(&input_parsed[..], &mut output) {
        Ok(_) => {
            let output_hex = output.to_hex();
            return format!("{}{}", "0x", output_hex);
        }
        Err(_) => return "0x".into(),
    }
}

#[wasm_bindgen]
pub fn ec_add(input_str: String) -> String {
    let input_parsed = FromHex::from_hex(&*input_str).unwrap();

    let mut output = [0u8; 64];
    match ethereum_bn128::bn128_add(&input_parsed[..], &mut output) {
        Ok(_) => {
            let output_hex = output.to_hex();
            return format!("{}{}", "0x", output_hex);
        }
        Err(_) => return "0x".into(),
    }
}

#[wasm_bindgen]
pub fn ec_pairing(input_str: String) -> String {
    let input_parsed = FromHex::from_hex(&*input_str).unwrap();

    let mut output = [0u8; 32];
    match ethereum_bn128::bn128_pairing(&input_parsed[..], &mut output) {
        Ok(_) => {
            let output_hex = output.to_hex();
            return format!("{}{}", "0x", output_hex);
        }
        Err(_) => return "0x".into(),
    }
}