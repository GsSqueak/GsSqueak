private
prepareToTrackCenterOfRotation: evt with: rotationHandle
	"The mouse went down on the center of rotation."

	evt hand obtainHalo: self.
	evt shiftPressed
		ifTrue:
			[self removeAllHandlesBut: rotationHandle.
			rotationHandle setProperty: #trackCenterOfRotation toValue: true.
			evt hand showTemporaryCursor: Cursor blank]
		ifFalse:
			[ActiveHand spawnBalloonFor: rotationHandle]