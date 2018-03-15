#include <stdint.h>
#include <unistd.h>

#include "BPFont.xbm"


void ffi_display_string(const char *string,
                        uint32_t dest_x,
                        uint32_t dest_y,
                        uint32_t *bitmap,
                        uint32_t bitmap_width,
                        uint32_t bitmap_height) {
    uint32_t x;
    uint32_t y;
    size_t index;
    for (index = 0; string[index] != '\0'; index++) {
        for (y = 0; y < 16; y++) {
            for (x = 0; x < 8; x++) {
                if (dest_x + x < bitmap_width && dest_y + y < bitmap_height) {
                    unsigned char code = string[index];
                    if (code >= 128)
                        code = 2;
                    if (BPFont_bits[128 * y + code] & (1 << x)) {
                        bitmap[(dest_y + y) * bitmap_width + dest_x + x] = 0xff0000ff;
                    }
                }
            }
        }
        dest_x += 8;
    }
}
