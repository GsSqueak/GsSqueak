#ifndef WINDOW_H
#define WINDOW_H

#include <SDL.h>

#include "mouse.h"
#include "keyboard.h"
#include "events.h"

struct Window {
    SDL_Window *sdl_window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;

    uint32_t width;

    struct MouseState mouse_state;
    struct ModifierState modifier_state;
    struct EventQueue event_queue;
};

#endif
