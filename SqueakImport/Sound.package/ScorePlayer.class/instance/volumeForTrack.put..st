accessing
volumeForTrack: trackIndex put: aNumber

	| newVol oldLeft oldRight oldFullVol left right |
	trackIndex > leftVols size ifTrue: [^ self].
	newVol := ((aNumber asFloat max: 0.0) min: 1.0) * ScaleFactor.
	oldLeft := leftVols at: trackIndex.
	oldRight := rightVols at: trackIndex.
	oldFullVol := oldLeft max: oldRight.
	oldFullVol = 0 ifTrue: [oldFullVol := 1.0].
	oldLeft < oldFullVol
		ifTrue: [
			left := newVol * oldLeft / oldFullVol.
			right := newVol]
		ifFalse: [
			left := newVol.
			right := newVol * oldRight / oldFullVol].
	leftVols at: trackIndex put: left asInteger.
	rightVols at: trackIndex put: right asInteger.
