#include "mouse.h"
#include "keyboard.h"
#include "window.h"

struct Window *ffi_create_window(uint32_t width,
                                 uint32_t height) {
    struct Window *window = malloc(sizeof(struct Window));

    window->sdl_window = SDL_CreateWindow("GsSqueak",
                                          SDL_WINDOWPOS_UNDEFINED,
                                          SDL_WINDOWPOS_UNDEFINED,
                                          width,
                                          height,
                                          SDL_WINDOW_RESIZABLE);
    window->renderer = SDL_CreateRenderer(window->sdl_window, -1, 0);
    window->texture = SDL_CreateTexture(window->renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, width, height);
    window->width = width;

    window->mouse_state = (struct MouseState) {
        .x = 0,
        .y = 0,
        .left_button_pressed = false,
        .middle_button_pressed = false,
        .right_button_pressed = false
    };

    window->modifier_state = (struct ModifierState) {
        .ctrl_l_pressed = false,
        .ctrl_r_pressed = false,
        .alt_pressed = false,
        .shift_l_pressed = false,
        .shift_r_pressed = false
    };

    window->event_queue = (struct EventQueue) {
        .first = NULL,
        .last = NULL
    };

    return window;
}


uint32_t ffi_get_window_size(struct Window *window,
                             struct WindowSize *result) {
    SDL_GetWindowSize(window->sdl_window, &result->x, &result->y);
}


void ffi_set_window_size(struct Window *window,
                         uint32_t width,
                         uint32_t height) {
    SDL_SetWindowSize(window->sdl_window, width, height);
    SDL_DestroyTexture(window->texture);
    window->texture = SDL_CreateTexture(window->renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, width, height);
    window->width = width;
}


void ffi_draw_window(struct Window *window,
                     char *data) {
    SDL_UpdateTexture(window->texture, NULL, data, window->width * sizeof(Uint32));
    SDL_RenderClear(window->renderer);
    SDL_RenderCopy(window->renderer, window->texture, NULL, NULL);
    SDL_RenderPresent(window->renderer);
}


void ffi_destroy_window(struct Window *window) {
    SDL_DestroyTexture(window->texture);
    SDL_DestroyRenderer(window->renderer);
    SDL_DestroyWindow(window->sdl_window);
}


static void fetch_new_events(struct Window *window) {
    SDL_Event sdl_event;

    while (SDL_PollEvent(&sdl_event)) {
        switch (sdl_event.type) {
            case SDL_MOUSEMOTION:
                handle_mouse_motion_event(&sdl_event.motion,
                                          &window->modifier_state,
                                          &window->mouse_state,
                                          &window->event_queue);
                break;
            case SDL_MOUSEBUTTONUP:
            case SDL_MOUSEBUTTONDOWN:
                handle_mouse_button_event(&sdl_event.button,
                                          &window->modifier_state,
                                          &window->mouse_state,
                                          &window->event_queue);
                break;
            case SDL_KEYUP:
            case SDL_KEYDOWN:
                handle_keyboard_event(&sdl_event.key,
                                      &window->modifier_state,
                                      &window->event_queue);
                break;
        }
    }
}


void ffi_process_events(struct Window *window,
                        struct SqueakEvent *squeak_event) {
    struct EventQueue *event_queue = &window->event_queue;
    if (event_queue->first == NULL) {
        fetch_new_events(window);
    }
    if (event_queue->first != NULL) {
        memcpy(squeak_event, &event_queue->first->event, sizeof(struct SqueakEvent));

        struct EventQueueNode *new_head = event_queue->first->next;
        free(event_queue->first);
        event_queue->first = new_head;
        if (new_head == NULL) {
            event_queue->last = NULL;
        }
    } else {
        bzero(squeak_event, sizeof(struct SqueakEvent));
    }
}
