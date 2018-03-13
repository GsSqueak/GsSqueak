#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#include <SDL.h>

#include "keyconstants.h"
#include "BPFont.xbm"


enum SqueakMouseButtonState {
    MOUSE_UP = 0,
    MOUSE_DOWN = 1
};


__attribute__ ((constructor)) void init_graffics(void) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_StartTextInput();
}

__attribute__ ((destructor)) void fini_graffics(void) {
    SDL_Quit();
}








void displayString(const char *string, uint32_t destX, uint32_t destY, uint32_t *bitmap, uint32_t bitmapWidth, uint32_t bitmapHeight) {
    uint32_t x;
    uint32_t y;
    for ( ; *string != '\0'; string++, destX += 8) {
        for (y = 0; y < 16; y++) {
            for (x = 0; x < 8; x++) {
                if (destX + x < bitmapWidth && destY + y < bitmapHeight) {
                    unsigned char code = *string;
                    if (code >= 128)
                        code = 2;
                    if (BPFont_bits[128 * y + code] & (1 << x)) {
                        bitmap[(destY + y) * bitmapWidth + destX + x] = 0xff0000ff;
                    }
                }
            }
        }
    }
}


