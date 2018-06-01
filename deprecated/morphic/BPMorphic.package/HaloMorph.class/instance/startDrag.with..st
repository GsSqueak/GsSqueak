private
startDrag: evt with: dragHandle 
	"Drag my target without removing it from its owner."
	| _gsSqueakTemp_itsOwner |
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: dragHandle.
	positionOffset := dragHandle center
				- (target point: target position in: owner).
	((_gsSqueakTemp_itsOwner := target topRendererOrSelf owner) notNil
			and: [_gsSqueakTemp_itsOwner automaticViewing])
		ifTrue: [target openViewerForArgument]