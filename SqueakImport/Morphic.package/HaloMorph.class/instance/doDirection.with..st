private
doDirection: anEvent with: directionHandle
	"The mouse went down on the forward-direction halo handle; respond appropriately."

	anEvent hand obtainHalo: self.
	anEvent shiftPressed
		ifTrue:
			[directionArrowAnchor := (target point: target referencePosition in: self world) rounded.
			self positionDirectionShaft: directionHandle.
			self removeAllHandlesBut: directionHandle.
			directionHandle setProperty: #trackDirectionArrow toValue: true]
		 ifFalse:
			[ActiveHand spawnBalloonFor: directionHandle]