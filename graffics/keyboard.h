#ifndef _KEYBOARD_H
#define _KEYBOARD_H

#include <stdbool.h>

#include <SDL.h>

#include "events.h"

struct ModifierState {
    bool ctrl_l_pressed;
    bool ctrl_r_pressed;
    bool alt_pressed;
    bool shift_l_pressed;
    bool shift_r_pressed;
};
extern void handle_text_event(const SDL_TextInputEvent *sdl_event,
                           struct ModifierState *modifier_state,
                           struct EventQueue *event_queue);

extern void handle_keyboard_event(const SDL_KeyboardEvent *sdl_event,
                                  struct ModifierState *modifier_state,
                                  struct EventQueue *event_queue);

extern uint32_t modifier_state_to_squeak(const struct ModifierState *modifier_state);

#endif
