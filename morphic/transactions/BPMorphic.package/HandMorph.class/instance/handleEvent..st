events-processing
handleEvent: unfilteredEvent
  | _gsSqueakTemp_filteredEvent |
  self owner
    ifNil: [ ^ unfilteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  self logEvent: unfilteredEvent.	"Mouse-over events occur really, really, really often. They are kind of
	the heart beat of the Morphic UI process."
  unfilteredEvent isMouseOver
    ifTrue: [ ^ self sendMouseEvent: unfilteredEvent ].
  self showEvent: unfilteredEvent.
  self sendListenEvents: unfilteredEvent.
  _gsSqueakTemp_filteredEvent := self
    sendFilterEventCapture: unfilteredEvent
    for: nil.	"filteredEvent := unfilteredEvent"	"<-- use this to disable global capture filters"
  _gsSqueakTemp_filteredEvent wasIgnored
    ifTrue: [ 
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  _gsSqueakTemp_filteredEvent isWindowEvent
    ifTrue: [ 
      self sendEvent: _gsSqueakTemp_filteredEvent focus: nil.
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  _gsSqueakTemp_filteredEvent isKeyboard
    ifTrue: [ 
      self sendKeyboardEvent: _gsSqueakTemp_filteredEvent.
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  _gsSqueakTemp_filteredEvent isDropEvent
    ifTrue: [ 
      self sendEvent: _gsSqueakTemp_filteredEvent focus: nil.
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  _gsSqueakTemp_filteredEvent isMouse
    ifFalse: [ 
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].	"********** MOUSE EVENT ***********"
  lastMouseEvent := _gsSqueakTemp_filteredEvent.	"Check for pending drag or double click operations."
  mouseClickState
    ifNotNil: [ 
      (mouseClickState handleEvent: _gsSqueakTemp_filteredEvent from: self)
        ifFalse: [ 
          "Possibly dispatched #click: or something and will not
					re-establish otherwise"
          self mouseOverHandler processMouseOver: lastMouseEvent.
          ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >>
					#handleEvent: " ] ].
  _gsSqueakTemp_filteredEvent isMouseWheel
    ifTrue: [ 
      mouseWheelState ifNil: [ mouseWheelState := MouseWheelState new ].
      mouseWheelState handleEvent: _gsSqueakTemp_filteredEvent from: self.
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].
  _gsSqueakTemp_filteredEvent isMove
    ifTrue: [ 
      self position: _gsSqueakTemp_filteredEvent position.
      self sendMouseEvent: _gsSqueakTemp_filteredEvent.
      self mouseOverHandler processMouseOver: lastMouseEvent.
      ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:" ].	"Issue a synthetic move event if we're not at the position of the event"
  _gsSqueakTemp_filteredEvent position = self position
    ifFalse: [ self moveToEvent: _gsSqueakTemp_filteredEvent ].	"Drop submorphs on button events"
  self hasSubmorphs
    ifTrue: [ self dropMorphs: _gsSqueakTemp_filteredEvent ]
    ifFalse: [ self sendMouseEvent: _gsSqueakTemp_filteredEvent ].
  self mouseOverHandler processMouseOver: lastMouseEvent.
  ^ _gsSqueakTemp_filteredEvent	"not necessary but good style -- see Morph >> #handleEvent:"