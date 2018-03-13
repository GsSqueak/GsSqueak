#ifndef _MOUSE_H
#define _MOUSE_H

#include <stdbool.h>

#include <SDL.h>

#include "keyboard.h"
#include "events.h"

struct MouseState {
    uint32_t x;
    uint32_t y;
    bool left_button_pressed;
    bool middle_button_pressed;
    bool right_button_pressed;
};


extern void handle_mouse_button_event(const SDL_MouseButtonEvent *sdl_event,
                                      const struct ModifierState *modifier_state,
                                      struct MouseState *mouse_state,
                                      struct EventQueue *event_queue);

extern void handle_mouse_motion_event(const SDL_MouseMotionEvent *sdl_event,
                                      const struct ModifierState *modifier_state,
                                      struct MouseState *mouse_state,
                                      struct EventQueue *event_queue);
#endif
