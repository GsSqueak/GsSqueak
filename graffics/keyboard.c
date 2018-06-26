#include "events.h"
#include "keyconstants.h"
#include "keyboard.h"


enum SqueakKeyState {
    KEY_REPEAT = 0,
    KEY_DOWN = 1,
    KEY_UP = 2
};


/* adapted from RSqueak */
static uint32_t translate_keycode(SDL_Keycode keycode) {
    switch (keycode) {
        case SDLK_DOWN:
            return SQ_KEY_DOWN;
        case SDLK_LEFT:
            return SQ_KEY_LEFT;
        case SDLK_RIGHT:
            return SQ_KEY_RIGHT;
        case SDLK_UP:
            return SQ_KEY_UP;
        case SDLK_HOME:
            return SQ_KEY_HOME;
        case SDLK_END:
            return SQ_KEY_END;
        case SDLK_INSERT:
            return SQ_KEY_INSERT;
        case SDLK_BACKSPACE:
            return SQ_KEY_BACKSPACE;
        case SDLK_PAGEUP:
            return SQ_KEY_PAGEUP;
        case SDLK_PAGEDOWN:
            return SQ_KEY_PAGEDOWN;
        case SDLK_RETURN:
            return SQ_KEY_RETURN;
       /* case SDLK_LSHIFT:
            return SQ_KEY_SHIFT;
        case SDLK_RSHIFT:
            return SQ_KEY_SHIFT;
        case SDLK_LCTRL:
            return SQ_KEY_CTRL;
        case SDLK_RCTRL:
            return SQ_KEY_CTRL;*/
        case SDLK_PAUSE:
            return SQ_KEY_BREAK;
        case SDLK_CAPSLOCK:
            return SQ_KEY_CAPSLOCK;
        case SDLK_ESCAPE:
            return SQ_KEY_ESCAPE;
        case SDLK_PRINTSCREEN:
            return SQ_KEY_PRINT;
        case SDLK_DELETE:
            return SQ_KEY_DELETE;
        case SDLK_NUMLOCKCLEAR:
            return SQ_KEY_NUMLOCK;
        case SDLK_SCROLLLOCK:
            return SQ_KEY_SCROLLLOCK;
        default:
            return 0;
    }
}


uint32_t modifier_state_to_squeak(const struct ModifierState *modifier_state) {
    return (modifier_state->shift_l_pressed ? 0b0001 : 0)
        | (modifier_state->shift_r_pressed ? 0b0001 : 0)
        | (modifier_state->ctrl_l_pressed ? 0b0010 : 0)
        | (modifier_state->ctrl_r_pressed ? 0b0010 : 0)
        | (modifier_state->alt_pressed ? 0b1000 : 0);
}


static void emit_keyboard_event(const struct ModifierState *modifier_state,
                                uint32_t character_code,
                                uint32_t press_state,
                                uint32_t time_stamp,
                                struct EventQueue *event_queue) {
    struct EventQueueNode *event_node = malloc(sizeof(struct EventQueueNode));

    event_node->next = NULL;
    event_node->event = (struct SqueakEvent) {
        .type = EVENT_TYPE_KEYBOARD,
        .time_stamp = time_stamp,
        .key = (struct KeyEvent) {
            .character_code = character_code,
            .press_state = press_state,
            .modifier_keys = modifier_state_to_squeak(modifier_state),
            .utf8_key = character_code
        }
    };

    if (event_queue->last == NULL)
        event_queue->first = event_node;
    else
        event_queue->last->next = event_node;
    event_queue->last = event_node;
}

void handle_text_event(const SDL_TextInputEvent *sdl_event,
                           struct ModifierState *modifier_state,
                           struct EventQueue *event_queue) {
    printf("ti: %i \n",sdl_event->text[0]);
    emit_keyboard_event(modifier_state,
                                sdl_event->text[0],
                                KEY_REPEAT,
                                sdl_event->timestamp,
                                event_queue);

}

void handle_keyboard_event(const SDL_KeyboardEvent *sdl_event,
                           struct ModifierState *modifier_state,
                           struct EventQueue *event_queue) {
    bool pressed = sdl_event->type == SDL_KEYDOWN;
    switch (sdl_event->keysym.sym) {
        case SDLK_LCTRL:
            modifier_state->ctrl_l_pressed = pressed;
            break;
        case SDLK_RCTRL:
            modifier_state->ctrl_r_pressed = pressed;
            break;
        case SDLK_LALT:
            modifier_state->alt_pressed = pressed;
            break;
        case SDLK_LSHIFT:
            modifier_state->shift_l_pressed = pressed;
            break;
        case SDLK_RSHIFT:
            modifier_state->shift_r_pressed = pressed;
            break;
    }
    //modifier_state->shift_l_pressed  = false;
    char special_character_code = translate_keycode(sdl_event->keysym.sym);
    char character_code = special_character_code;
    if(character_code == 0 && sdl_event->keysym.sym < 256)
        character_code = sdl_event->keysym.sym;


    const uint32_t *press_states;
    if (sdl_event->repeat) {
        /*if(sdl_event->keysym.sym == character_code){//!modifier
            emit_keyboard_event(modifier_state,
                                character_code,
                                KEY_REPEAT,
                                sdl_event->timestamp,
                                event_queue);
        }*/
    } else if (sdl_event->type == SDL_KEYDOWN) {
        emit_keyboard_event(modifier_state,
                            character_code,
                            KEY_DOWN,
                            sdl_event->timestamp,
                            event_queue);

        if(special_character_code){//!special key
            printf("ni: %i \n",special_character_code);
            emit_keyboard_event(modifier_state,
                                special_character_code,
                                KEY_REPEAT,
                                sdl_event->timestamp,
                                event_queue);
        }
    } else {
        emit_keyboard_event(modifier_state,
                            character_code,
                            KEY_UP,
                            sdl_event->timestamp,
                            event_queue);
    }
}
