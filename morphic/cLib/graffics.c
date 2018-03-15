#include <SDL.h>

#include "keyconstants.h"
#include "BPFont.xbm"


__attribute__ ((constructor)) void init_graffics(void) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_StartTextInput();
}

__attribute__ ((destructor)) void fini_graffics(void) {
    SDL_Quit();
}
