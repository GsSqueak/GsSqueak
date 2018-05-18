An EventSensor is an interface to the user input devices.
There is at least one instance of EventSensor named Sensor in the system.

EventSensor is a replacement for the earlier InputSensor implementation based on a set of (optional) event primitives. An EventSensor updates its state when events are received so that all state based users of Sensor (e.g., Sensor keyboard, Sensor leftShiftDown, Sensor mouseButtons) will work exactly as before, by moving the current VM mechanisms into EventSensor itself. An optional input semaphore is part of the new design.

For platforms that support true asynchronous event notification, the semaphore will be signaled to indicate pending events.
On platforms that do not support asynchronous notifications about events, the UI will have to poll EventSensor periodically to read events from the VM.

Instance variables:
	mouseButtons <Integer>	- mouse button state as replacement for primMouseButtons
	mousePosition <Point>	- mouse position as replacement for primMousePt
	keyboardBuffer <SharedQueue>	- keyboard input buffer
	interruptKey <Integer>			- currently defined interrupt key
	interruptSemaphore <Semaphore>	- the semaphore signaled when the interruptKey is detected
	eventQueue <SharedQueue>	- an optional event queue for event driven applications
	inputSemaphore <Semaphore>- the semaphore signaled by the VM if asynchronous event notification is supported
	lastEventPoll <Integer>		- the last millisecondClockValue at which we called fetchMoreEvents
	hasInputSemaphore <Boolean>	- true if my inputSemaphore has actually been signaled at least once.

Class variables:
	ButtonDecodeTable <ByteArray> - maps mouse buttons as reported by the VM to ones reported in the events.
	KeyDecodeTable <Dictionary<SmallInteger->SmallInteger>> - maps some keys and their modifiers to other keys (used for instance to map Ctrl-X to Alt-X)
	InterruptSemaphore <Semaphore> - signalled by the the VM and/or the event loop upon receiving an interrupt keystroke.
	InterruptWatcherProcess <Process> - waits on the InterruptSemaphore and then responds as appropriate.
	EventPollPeriod <Integer>	- the number of milliseconds to wait between polling for more events in the userInterruptHandler.
	EventTicklerProcess <Process>	- the process that makes sure that events are polled for often enough (at least every EventPollPeriod milliseconds).

Event format:
The current event format is very simple. Each event is recorded into an 8 element array. All events must provide some SmallInteger ID (the first field in the event buffer) and a time stamp (the second field in the event buffer), so that the difference between the time stamp of an event and the current time can be reported.

Currently, the following events are defined:

Null event
=============
The Null event is returned when the ST side asks for more events but no more events are available.
Structure:
[1]		- event type 0
[2-8]	- unused

Mouse event structure
==========================
Mouse events are generated when mouse input is detected.
Structure:
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

Keyboard events
====================
Keyboard events are generated when keyboard input is detected.
[1]	- event type 2
[2]	- time stamp
[3]	- character code
		For now the character code is in Mac Roman encoding.
[4]	- press state; integer with the following meaning
		0	-	character
		1	-	key press (down)
		2	- 	key release (up)
[5]	- modifier keys (same as in mouse events)
[6]	- reserved.
[7]	- reserved.
[8]	- reserved.
