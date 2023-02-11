pushd alvr
cargo xtask clean
cargo xtask prepare-deps --platform linux --no-nvidia --gpl
cargo xtask build-server --platform linux --no-nvidia --gpl
popd