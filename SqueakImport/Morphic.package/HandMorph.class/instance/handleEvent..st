events-processing
handleEvent: unfilteredEvent

	| filteredEvent |
	owner ifNil: [^ unfilteredEvent  "not necessary but good style -- see Morph >> #handleEvent:"].
	
	self logEvent: unfilteredEvent.

	"Mouse-over events occur really, really, really often. They are kind of the heart beat of the Morphic UI process."
	unfilteredEvent isMouseOver ifTrue: [^ self sendMouseEvent: unfilteredEvent].

	self showEvent: unfilteredEvent.
	self sendListenEvents: unfilteredEvent.
	
	filteredEvent := self sendFilterEventCapture: unfilteredEvent for: nil.
	"filteredEvent := unfilteredEvent" " <-- use this to disable global capture filters"
	
	filteredEvent wasIgnored ifTrue: [
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].
	
	filteredEvent isWindowEvent ifTrue: [
		self sendEvent: filteredEvent focus: nil.
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].

	filteredEvent isKeyboard ifTrue:[
		self sendKeyboardEvent: filteredEvent.
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].
			
	filteredEvent isDropEvent ifTrue:[
		self sendEvent: filteredEvent focus: nil.
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].

	filteredEvent isMouse ifFalse: [
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].

	" ********** MOUSE EVENT *********** "

	lastMouseEvent := filteredEvent.

	"Check for pending drag or double click operations."
	mouseClickState ifNotNil:[
		(mouseClickState handleEvent: filteredEvent from: self) ifFalse:[
			"Possibly dispatched #click: or something and will not re-establish otherwise"
			self mouseOverHandler processMouseOver: lastMouseEvent.
			^ filteredEvent]].

	filteredEvent isMouseWheel ifTrue: [
		mouseWheelState ifNil: [mouseWheelState := MouseWheelState new].
		mouseWheelState handleEvent: filteredEvent from: self.
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].

	filteredEvent isMove ifTrue:[
		self position: filteredEvent position.
		self sendMouseEvent: filteredEvent.
		self mouseOverHandler processMouseOver: lastMouseEvent.
		^ filteredEvent].

	"Issue a synthetic move event if we're not at the position of the event"
	filteredEvent position = self position
		ifFalse: [self moveToEvent: filteredEvent].
	
	"Drop submorphs on button events"
	self hasSubmorphs
		ifTrue:[self dropMorphs: filteredEvent]
		ifFalse:[self sendMouseEvent: filteredEvent].

	self mouseOverHandler processMouseOver: lastMouseEvent.
	^ filteredEvent "not necessary but good style -- see Morph >> #handleEvent:"	