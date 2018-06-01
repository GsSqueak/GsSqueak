pool initialization
initialize
	"EventSensorConstants initialize"
	RedButtonBit := 4.
	BlueButtonBit := 2.
	YellowButtonBit := 1.

	ShiftKeyBit := 1.
	CtrlKeyBit := 2.
	OptionKeyBit := 4.
	CommandKeyBit := 8.

	"Types of events"
	EventTypeNone := 0.
	EventTypeMouse := 1.
	EventTypeKeyboard := 2.
	EventTypeDragDropFiles := 3.
	EventTypeMenu := 4.
	EventTypeWindow := 5.
	EventTypeComplex := 6.
	EventTypeMouseWheel := 7.

	"Press codes for keyboard events"
	EventKeyChar := 0.
	EventKeyDown := 1.
	EventKeyUp := 2.

	"Host window events"
	WindowEventMetricChange := 1.
	WindowEventClose := 2.
	WindowEventIconise := 3. 
	WindowEventActivated	:= 4. 
	WindowEventPaint := 5.
	WindowEventStinks := 6.

	"types for touch events"
	EventTouchDown := 1.
	EventTouchUp := 2.
	EventTouchMoved := 3.
	EventTouchStationary := 4.
	EventTouchCancelled := 5.

	"iOS touch phase constants"
	TouchPhaseBegan := 0.
	TouchPhaseMoved := 1.
	TouchPhaseStationary := 2.
	TouchPhaseEnded := 3.
	TouchPhaseCancelled := 4.
