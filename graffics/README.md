The C-library used for the graphical output

# Installation

1. Install SDL2 using `sudo apt-get install libsdl2-dev`

2. Set `$GEMSTONE` to the your GemStone installation (e.g. `GsDevKit_home/shared/downloads/products/GemStone64Bit3.5.0-x86_64.Linux`)

3. Call `make install` to compile the library into the lib directory of your GemStone installation

OR

2. Call `make` and copy the generated `libgraFFIcs.so` into the lib directory
