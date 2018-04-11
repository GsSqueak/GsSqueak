printing
printOn: aStream 
	| _gsSqueakTemp_recipients |
	super printOn: aStream.
	#('mouseDownSelector' 'mouseStillDownSelector' 'mouseUpSelector' 'mouseEnterSelector' 'mouseLeaveSelector' 'mouseEnterDraggingSelector' 'mouseLeaveDraggingSelector' 'mouseWheelSelector' 'doubleClickSelector' 'keyStrokeSelector' 'keyUpSelector' 'keyDownSelector' 'startDragSelector' 'clickSelector' 'keyboardFocusChangeSelector' )
		do: [:aName | | aVal | (aVal := self instVarNamed: aName) notNil
				ifTrue: [aStream nextPutAll: '; ' , aName , '=' , aVal]].
	(_gsSqueakTemp_recipients := self allRecipients) notEmpty
		ifTrue: [aStream nextPutAll: ' recipients: '.
			_gsSqueakTemp_recipients printOn: aStream]