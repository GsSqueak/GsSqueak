#include <stdint.h>
#include <stdio.h>
#include <SDL.h>
#include <unistd.h>

SDL_Window *window = NULL;
SDL_Renderer * renderer;
SDL_Texture * texture;

int winW;
int winH;

struct {
    uint32_t x, y;
} MouseState;

typedef {
    uint32_t eventType;
    uint32_t timeStamp;
    uint32_t x, y;
    uint32_t buttonState, modifierKeys;
    uint32_t unused[2];
}


[1]	- event type 1
[2]	- time stamp
[3]	- mouse x position
[4]	- mouse y position
[5]	- button state; bitfield with the following entries:
		1	-	yellow (e.g., right) button
		2	-	blue (e.g., middle) button
		4	-	red (e.g., left) button
		[all other bits are currently undefined]
[6]	- modifier keys; bitfield with the following entries:
		1	-	shift key
		2	-	ctrl key
		4	-	(Mac specific) option key
		8	-	Cmd/Alt key
		[all other bits are currently undefined]
[7]	- reserved.
[8]	- reserved.

int openWindow(int x, int y, int w, int h){
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

void closeWindow(){
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void sendMouseState(uint32_t *e, uint32_t timestamp) {
    
}

void getEvents(uint32_t *e) {
    SDL_Event event;
    
    if (!SDL_PollEvent(&event)) {
        e[0] = 0;
        return;
    }
    switch (event.type) {
        case SDL_MOUSEMOTION:
            MouseState.x = event.motion.x;
            MouseState.y = event.motion.y;
            break;
}
