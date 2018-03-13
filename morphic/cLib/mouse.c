#include "events.h"
#include "mouse.h"
#include "keyboard.h"


static uint32_t mouse_state_to_squeak(const struct MouseState *mouse_state) {
    return (mouse_state->left_button_pressed ? 0b100 : 0)
        | (mouse_state->middle_button_pressed ? 0b010 : 0)
        | (mouse_state->right_button_pressed ? 0b001 : 0);
}


static void emit_mouse_event(const struct MouseState *mouse_state,
                             const struct ModifierState *modifier_state,
                             uint32_t time_stamp,
                             struct EventQueue *event_queue) {
    struct EventQueueNode *event_node = malloc(sizeof(struct EventQueueNode));

    event_node->next = NULL;
    event_node->event = (struct SqueakEvent) {
        .type = EVENT_TYPE_MOUSE,
        .time_stamp = time_stamp,
        .mouse = (struct MouseEvent) {
            .x = mouse_state->x,
            .y = mouse_state->y,
            .button_state = mouse_state_to_squeak(mouse_state),
            .modifier_keys = modifier_state_to_squeak(modifier_state)
        }
    };

    event_queue->last->next = event_node;
    event_queue->last = event_node;
}


void handle_mouse_button_event(const SDL_MouseButtonEvent *sdl_event,
                               const struct ModifierState *modifier_state,
                               struct MouseState *mouse_state,
                               struct EventQueue *event_queue) {
    bool pressed = sdl_event->state == SDL_PRESSED;
    switch (sdl_event->button) {
        case SDL_BUTTON_LEFT:
            mouse_state->left_button_pressed = pressed;
            break;
        case SDL_BUTTON_MIDDLE:
            mouse_state->middle_button_pressed = pressed;
            break;
        case SDL_BUTTON_RIGHT:
            mouse_state->right_button_pressed = pressed;
            break;
    }

    mouse_state->x = sdl_event->x;
    mouse_state->y = sdl_event->y;

    emit_mouse_event(mouse_state,
                     modifier_state,
                     sdl_event->timestamp,
                     event_queue);
}


void handle_mouse_motion_event(const SDL_MouseMotionEvent *sdl_event,
                               const struct ModifierState *modifier_state,
                               struct MouseState *mouse_state,
                               struct EventQueue *event_queue) {
    mouse_state->x = sdl_event->x;
    mouse_state->y = sdl_event->y;

    emit_mouse_event(mouse_state,
                     modifier_state,
                     sdl_event->timestamp,
                     event_queue);
}
