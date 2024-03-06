// Converts WASM bytecode to JSON object to create JSON that can be loaded in ESM module without requiring `fetch`
const wasmBytes = require('fs').readFileSync('./wasm/rustbn_bg.wasm')
const encoded = Buffer.from(wasmBytes, 'binary').toString('base64');
const json = {
    wasm: encoded
}
require('fs').writeFileSync('./src.ts/wasm.ts', `export default ${JSON.stringify(json)}`)
