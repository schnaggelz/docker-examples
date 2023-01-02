pushd alvr
cargo xtask clean
cargo xtask prepare-deps --platform linux --no-nvidia --local-ffmpeg
cargo xtask build-server --platform linux --no-nvidia --local-ffmpeg
popd