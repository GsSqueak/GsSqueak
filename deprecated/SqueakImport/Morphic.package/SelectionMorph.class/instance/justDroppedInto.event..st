dropping/grabbing
justDroppedInto: newOwner event: evt
	"This message is sent to a dropped morph after it has been dropped on -- and been accepted by -- a drop-sensitive morph"

	selectedItems isEmpty ifTrue:
		["Hand just clicked down to draw out a new selection"
		^ self extendByHand: evt hand].
	dupLoc ifNotNil: [dupDelta := self position - dupLoc].
	selectedItems reverseDo: [:m | 
		WorldState addDeferredUIMessage:
			[m referencePosition: (newOwner localPointToGlobal: m referencePosition).
			newOwner handleDropMorph:
				(DropEvent new setPosition: evt cursorPoint contents: m hand: evt hand)]].
	selectedItems := nil.
	self removeHalo. 
	self halo ifNotNil: [ :halo | halo visible: false ]. 
	self delete.
	evt wasHandled: true