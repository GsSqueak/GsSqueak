#include <stdint.h>
#include <stdio.h>
#include <SDL.h>
#include <unistd.h>

SDL_Window *window = NULL;
SDL_Renderer * renderer;
SDL_Texture * texture;

int winW;
int winH;

#define MOUSE_DOWN 1
#define MOUSE_UP 0

struct {
    uint32_t x, y;
    int left, middle, right;
} MouseState;

#define EVENT_TYPE_NONE     0
#define EVENT_TYPE_MOUSE    1

typedef struct {
    uint32_t type;
    uint32_t timeStamp;
    uint32_t x, y;
    uint32_t buttonState, modifierKeys;
    uint32_t unused[2];
} MouseEvent;

int openWindow(int x, int y, int w, int h)
{
    if(window != NULL)
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
    texture = SDL_CreateTexture(renderer,
        SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, w, h);

    MouseState.left = MouseState.middle = MouseState.right = MOUSE_UP;
    
    return 0;
}

int drawBitmap(char* data, int l, int r, int t, int b)
{
    //SDL_Rect drawRect;
    //drawRect.y = l;
    //drawRect.r = r
    
    SDL_UpdateTexture(texture, NULL, data, winW * sizeof(Uint32));
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, NULL, NULL);
    SDL_RenderPresent(renderer);
    return 0;
}

void closeWindow()
{
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void sendMouseState(MouseEvent *SqEv, uint32_t timestamp)
{
    SqEv->type = EVENT_TYPE_MOUSE;
    SqEv->timeStamp = timestamp;
    SqEv->x = MouseState.x;
    SqEv->y = MouseState.y;
    SqEv->buttonState = MouseState.right
                      | (MouseState.middle << 1)
                      | (MouseState.left << 2);
    SqEv->modifierKeys = 0;
}

void handleButtonEvent(uint8_t button, int value)
{
    switch (button)
    {
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

void getEvents(void *e)
{
    SDL_Event event;
    
    while (SDL_PollEvent(&event))
    {
        switch (event.type)
        {
        case SDL_MOUSEMOTION:
            MouseState.x = event.motion.x;
            MouseState.y = event.motion.y;
            sendMouseState(e, event.motion.timestamp);
            return;
        case SDL_MOUSEBUTTONUP:
        case SDL_MOUSEBUTTONDOWN:
            MouseState.x = event.button.x;
            MouseState.y = event.button.y;
            handleButtonEvent(
                    event.button.button,
                    SDL_MOUSEBUTTONUP ? MOUSE_UP: MOUSE_DOWN);
            sendMouseState(e, event.button.timestamp);
            return;
        }
    }

    bzero(e, 8 * sizeof(uint32_t));
}
