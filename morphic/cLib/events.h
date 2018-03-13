#ifndef _EVENTS_H
#define _EVENTS_H

#include <stdint.h>

struct KeyEvent {
    uint32_t character_code;
    uint32_t press_state;
    uint32_t modifier_keys;
    uint32_t unused_6;
    uint32_t unused_7;
    uint32_t unused_8;
};

struct MouseEvent {
    uint32_t x;
    uint32_t y;
    uint32_t button_state;
    uint32_t modifier_keys;
    uint32_t unused_7;
    uint32_t unused_8;
};

struct SqueakEvent {
    uint32_t type;
    uint32_t time_stamp;
    union {
        struct KeyEvent key;
        struct MouseEvent mouse;
    };
};

enum SqueakEventType {
    EVENT_TYPE_NONE = 0,
    EVENT_TYPE_MOUSE = 1,
    EVENT_TYPE_KEYBOARD = 2
};

struct EventQueueNode {
    struct EventQueueNode *next;
    struct SqueakEvent event;
};

struct EventQueue {
    struct EventQueueNode *first;
    struct EventQueueNode *last;
};

#endif
