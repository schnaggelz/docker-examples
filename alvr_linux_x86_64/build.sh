cargo xtask clean
cargo xtask prepare-deps --platform linux --no-nvidia 
cargo xtask build-server --platform linux --no-nvidia 