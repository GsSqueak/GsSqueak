private
doRot: evt with: rotHandle 
	"Update the rotation of my target if it is rotatable. Keep the relevant
	command object up to date."
	| _gsSqueakTemp_degrees |
	evt hand obtainHalo: self.
	_gsSqueakTemp_degrees := (evt cursorPoint
				- (target pointInWorld: target referencePosition)) degrees.
	_gsSqueakTemp_degrees := _gsSqueakTemp_degrees - angleOffset degrees.
	_gsSqueakTemp_degrees := _gsSqueakTemp_degrees
				detentBy: 10.0
				atMultiplesOf: 90.0
				snap: false.
	_gsSqueakTemp_degrees = 0.0
		ifTrue: [self setColor: Color lightBlue toHandle: rotHandle]
		ifFalse: [self setColor: Color blue toHandle: rotHandle].
	rotHandle
		submorphsDo: [:m | m color: rotHandle color makeForegroundColor].
	self removeAllHandlesBut: rotHandle.
	self showingDirectionHandles
		ifFalse: [self showDirectionHandles: true addHandles: false].
	self addDirectionHandles.
	target rotationDegrees: _gsSqueakTemp_degrees.
	rotHandle position: evt cursorPoint - (rotHandle extent // 2).
	(self valueOfProperty: #commandInProgress)
		ifNotNil: [:cmd | "Update the final rotation"
			cmd
				redoTarget: target renderedMorph
				selector: #heading:
				argument: _gsSqueakTemp_degrees].
	self layoutChanged