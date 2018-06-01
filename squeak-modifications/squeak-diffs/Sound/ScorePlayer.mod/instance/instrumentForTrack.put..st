accessing
instrumentForTrack: trackIndex put: aSoundProto

	trackIndex > instruments size ifTrue: [^ self].
	instruments at: trackIndex put: aSoundProto.
