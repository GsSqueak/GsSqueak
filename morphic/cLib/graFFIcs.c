/*
 *
 */
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#include <SDL.h>

#include "keyconstants.h"
#include "BPFont.xbm"

SDL_Window *window = NULL;
SDL_Renderer * renderer;
SDL_Texture * texture;

uint32_t winW;
uint32_t winH;

#define MOUSE_DOWN 1
#define MOUSE_UP 0
#define KEY_DOWN 1
#define KEY_UP 0

struct {
    uint32_t x;
    uint32_t y;
    uint32_t left;
    uint32_t middle;
    uint32_t right;
} MouseState;

struct {
    uint32_t ctrlL;
    uint32_t ctrlR;
    uint32_t alt;
    uint32_t shiftL;
    uint32_t shiftR;
} ModifierState;

#define EVENT_TYPE_NONE     0
#define EVENT_TYPE_MOUSE    1
#define EVENT_TYPE_KEYBOARD 2

typedef struct {
    uint32_t type;
    uint32_t timeStamp;
    uint32_t x;
    uint32_t y;
    uint32_t buttonState;
    uint32_t modifierKeys;
    uint32_t unused_7;
    uint32_t unused_8;
} MouseEvent;

typedef struct {
    uint32_t type;
    uint32_t timeStamp;
    uint32_t characterCode;
    uint32_t pressState;
    uint32_t modifierKeys;
    uint32_t unused_6;
    uint32_t unused_7;
    uint32_t unused_8;
} KeyEvent;


bool hasQueuedStroke;
KeyEvent queuedStroke;

uint32_t openWindow(uint32_t x, uint32_t y, uint32_t w, uint32_t h) {
    if (window != NULL)
        return 1;
    
    SDL_Init(SDL_INIT_VIDEO);  
    
    window = SDL_CreateWindow(
        "An SDL2 window",                  // window title
        x,           // initial x position
        y,           // initial y position
        w,                               // width, in pixels
        h,                               // height, in pixels
        0                  // flags - see below
    );
    
    winW = w;
    winH = h;
    
    renderer = SDL_CreateRenderer(window, -1, 0);
    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, w, h);

    MouseState.left = MouseState.middle = MouseState.right = MOUSE_UP;
    ModifierState.ctrlL = ModifierState.ctrlR = ModifierState.alt = ModifierState.shiftL = ModifierState.shiftR = KEY_UP;
    
    return 0;
}

int drawBitmap(char* data, int l, int r, int t, int b) {
    //SDL_Rect drawRect;
    //drawRect.y = l;
    //drawRect.r = r
    
    SDL_UpdateTexture(texture, NULL, data, winW * sizeof(Uint32));
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, NULL, NULL);
    SDL_RenderPresent(renderer);
    return 0;
}

void closeWindow() {
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

uint32_t mouseButtonState(void) {
    return MouseState.right
            | (MouseState.middle << 1)
            | (MouseState.left << 2);
}

uint32_t keyModifierState(void) {
    return ModifierState.shiftL
            | ModifierState.shiftR
            | (ModifierState.ctrlL << 1)
            | (ModifierState.ctrlR << 1)
            | (ModifierState.alt << 1);
}

void sendMouseState(MouseEvent *sqEv, uint32_t timestamp) {
    sqEv->type = EVENT_TYPE_MOUSE;
    sqEv->timeStamp = timestamp;
    sqEv->x = MouseState.x;
    sqEv->y = MouseState.y;
    sqEv->buttonState = mouseButtonState();
    sqEv->modifierKeys = keyModifierState();
}

void handleButtonEvent(uint8_t button, uint32_t value) {
    switch (button) {
        case SDL_BUTTON_LEFT:
            MouseState.left = value;
            break;
        case SDL_BUTTON_MIDDLE:
            MouseState.middle = value;
            break;
        case SDL_BUTTON_RIGHT:
            MouseState.right = value;
            break;
    }
}

//adapted from RSqueak
uint32_t translateKey(SDL_Keycode key) {
    switch (key) {
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
        case SDLK_LSHIFT:
            return SQ_KEY_SHIFT;
        case SDLK_RSHIFT:
            return SQ_KEY_SHIFT;
        case SDLK_LCTRL:
            return SQ_KEY_CTRL;
        case SDLK_RCTRL:
            return SQ_KEY_CTRL;
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
            if (key < 255)
                return key;
            return 0;
    }
}

void handleKeyEvent(KeyEvent * sqEv, SDL_Keycode keycode, uint32_t value, uint32_t repeat, uint32_t timestamp, SDL_Event event) {
    switch (keycode) {
        case SDLK_LCTRL:
            ModifierState.ctrlL = value;
            break;
        case SDLK_RCTRL:
            ModifierState.ctrlR = value;
            break;
        case SDLK_LALT:
            ModifierState.alt = value;
            break;
        case SDLK_LSHIFT:
            ModifierState.shiftL = value;
            break;
        case SDLK_RSHIFT:
            ModifierState.shiftR = value;
            break;
    }

    sqEv->type = EVENT_TYPE_KEYBOARD;
    sqEv->timeStamp = timestamp;
    sqEv->characterCode = translateKey(keycode);
    if (repeat)
        sqEv->pressState = 0;
    else if (value == KEY_DOWN)
        sqEv->pressState = 1;
    else
        sqEv->pressState = 2;
    sqEv->modifierKeys = keyModifierState();

    //generate stroke
    if (sqEv->pressState == 1) {
        queuedStroke = *sqEv;
        queuedStroke.pressState = 0;//stoke
        hasQueuedStroke = true;
    }
}

void getEvents(void *e) {
    if (hasQueuedStroke) {
        hasQueuedStroke = false;
        *((KeyEvent*)e) = queuedStroke;
        return;
    }

    SDL_Event event;
    
    while (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_MOUSEMOTION:
                MouseState.x = event.motion.x;
                MouseState.y = event.motion.y;
                sendMouseState((MouseEvent*)e, event.motion.timestamp);
                return;
            case SDL_MOUSEBUTTONUP:
            case SDL_MOUSEBUTTONDOWN:
                MouseState.x = event.button.x;
                MouseState.y = event.button.y;
                handleButtonEvent(
                        event.button.button,
                        event.type == SDL_MOUSEBUTTONUP ? MOUSE_UP : MOUSE_DOWN);
                sendMouseState((MouseEvent*)e, event.button.timestamp);
                return;
            case SDL_KEYUP:
            case SDL_KEYDOWN:
                handleKeyEvent(
                        (KeyEvent*)e,
                        event.key.keysym.sym,
                        event.type == SDL_KEYUP ? KEY_UP : KEY_DOWN,
                        event.key.repeat != 0,
                        event.key.timestamp,
                event);
                return;
	        default:
	            (*((KeyEvent*)e)).unused_7 = event.type;
	            return;
        }
    }

    bzero(e, 8 * sizeof(uint32_t));
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


