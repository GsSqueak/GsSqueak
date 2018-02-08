private events
generateWindowEvent: evtBuf 
	"Generate the appropriate window event for the given raw event buffer"
	| _gsSqueakTemp_evt |
	_gsSqueakTemp_evt := WindowEvent new.
	_gsSqueakTemp_evt setTimeStamp: evtBuf second.
	_gsSqueakTemp_evt timeStamp = 0
		ifTrue: [_gsSqueakTemp_evt setTimeStamp: Time eventMillisecondClock].
	_gsSqueakTemp_evt action: evtBuf third.
	_gsSqueakTemp_evt
		rectangle: (Rectangle origin: evtBuf fourth @ evtBuf fifth corner: evtBuf sixth @ evtBuf seventh).
	^ _gsSqueakTemp_evt