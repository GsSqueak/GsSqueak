event handling
handleEvent: evt from: aHand
  "Process the given mouse event to detect a click, double-click, or drag.
	Return true if the event should be processed by the sender, false if it
	shouldn't. NOTE: This method heavily relies on getting *all* mouse
	button events."

  | _gsSqueakTemp_localEvt _gsSqueakTemp_timedOut _gsSqueakTemp_isDrag |
  _gsSqueakTemp_timedOut := (evt timeStamp - firstClickTime) > dblClickTime.
  _gsSqueakTemp_localEvt := evt
    transformedBy: (clickClient transformedFrom: aHand owner).
  _gsSqueakTemp_isDrag := (_gsSqueakTemp_localEvt position
    - firstClickDown position) r > dragThreshold.
  clickState == #'firstClickDown'
    ifTrue: [ 
      "Careful here - if we had a slow cycle we may have a timedOut
			mouseUp event"
      (_gsSqueakTemp_timedOut and: [ _gsSqueakTemp_localEvt isMouseUp not ])
        ifTrue: [ 
          "timeout before #mouseUp -> keep waiting for drag if
					requested "
          clickState := #'firstClickTimedOut'.
          dragSelector
            ifNil: [ 
              aHand resetClickState.
              self
                doubleClickTimeout;
                click	"***" ].
          ^ true ].
      _gsSqueakTemp_localEvt isMouseUp
        ifTrue: [ 
          (_gsSqueakTemp_timedOut or: [ dblClickSelector isNil ])
            ifTrue: [ 
              self click.
              aHand resetClickState.
              ^ true ].	"Otherwise transfer to #firstClickUp"
          firstClickUp := evt copy.
          clickState := #'firstClickUp'.	"If timedOut or the client's not interested in dbl clicks
					get outta here"
          self click.
          aHand handleEvent: firstClickUp.
          ^ false ].
      _gsSqueakTemp_isDrag
        ifTrue: [ 
          "drag start"
          self doubleClickTimeout.	"***"
          aHand resetClickState.
          dragSelector
            ifNil: [ 
              "If no drag selector send #click instead"
              self click ]
            ifNotNil: [ self drag: firstClickDown ].
          ^ true ].
      ^ false ].
  clickState == #'firstClickTimedOut'
    ifTrue: [ 
      _gsSqueakTemp_localEvt isMouseUp
        ifTrue: [ 
          "neither drag nor double click"
          aHand resetClickState.
          self
            doubleClickTimeout;
            click.	"***"
          ^ true ].
      _gsSqueakTemp_isDrag
        ifTrue: [ 
          "drag start"
          aHand resetClickState.
          self
            doubleClickTimeout;
            drag: firstClickDown.	"***"
          ^ true ].
      ^ false ].
  clickState = #'firstClickUp'
    ifTrue: [ 
      _gsSqueakTemp_timedOut
        ifTrue: [ 
          "timed out after mouseUp - signal timeout and pass
					the event"
          aHand resetClickState.
          self doubleClickTimeout.	"***"
          ^ true ].
      _gsSqueakTemp_localEvt isMouseDown
        ifTrue: [ 
          "double click"
          clickState := #'secondClickDown'.
          ^ false ] ].
  clickState == #'secondClickDown'
    ifTrue: [ 
      _gsSqueakTemp_timedOut
        ifTrue: [ 
          "timed out after second mouseDown - pass event after
					signaling timeout"
          aHand resetClickState.
          self doubleClickTimeout.	"***"
          ^ true ].
      _gsSqueakTemp_isDrag
        ifTrue: [ 
          "drag start"
          self doubleClickTimeout.	"***"
          aHand resetClickState.
          dragSelector
            ifNil: [ 
              "If no drag selector send #click instead"
              self click ]
            ifNotNil: [ self drag: firstClickDown ].
          ^ true ].
      _gsSqueakTemp_localEvt isMouseUp
        ifTrue: [ 
          "double click"
          aHand resetClickState.
          self doubleClick.
          ^ false ] ].
  ^ true
