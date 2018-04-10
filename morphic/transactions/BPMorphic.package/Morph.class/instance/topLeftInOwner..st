-vivide-layout
topLeftInOwner: aPoint 
	"Like #extentInOwner: but for the top left position."
	| _gsSqueakTemp_delta |
	_gsSqueakTemp_delta := (aPoint - self topLeft) rounded.
	_gsSqueakTemp_delta = (0 @ 0)
		ifTrue: [^ self"fast path"].
	self
		withAllOwnersDo: [:m | "Assume that the world or a morph without layout policy allows
			for custom resizing of submorphs."
			((((m owner == m world
								or: [m owner layoutPolicy isNil])
							or: [m owner isNil])
						or: [m owner layoutPolicy isKindOf: ViConstraintLayout])
					or: [m owner layoutPolicy isTableLayout])
				ifTrue: [m topLeft: m topLeft + _gsSqueakTemp_delta.
					self flag: #fullBoundsNeeded.
					"mt: ...if called without #extentInOwner!"
					^ self"fast path"]]