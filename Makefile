
NAME=blinky_basic
TARGET=target/${NAME}.bin
RAW_TARGET=target/thumbv6m-none-eabi/release/${NAME}

upload: ${TARGET}
	arduino-cli upload -i $< -b arduino:samd:nano_33_iot -p ${PORT}

build: ${TARGET}


${TARGET}: ${RAW_TARGET}
	rust-objcopy -O binary $< $@

${RAW_TARGET}: src/*.rs
	cargo build --release

