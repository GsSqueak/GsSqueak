private
startDrag: evt with: dragHandle
	"Drag my target without removing it from its owner."

	| itsOwner |
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: dragHandle.
	positionOffset := dragHandle center - (target point: target position in: owner).

	 ((itsOwner := target topRendererOrSelf owner) notNil and:
			[itsOwner automaticViewing]) ifTrue:
				[target openViewerForArgument]