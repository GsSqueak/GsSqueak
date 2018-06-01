initialization
onScore: aMIDIScore

	| trackCount totalVol incr curr pan |
	score := aMIDIScore.
	trackCount := score tracks size.
	durationInTicks := score durationInTicks.
	instruments := (1 to: trackCount) collect: [:i | FMSound oboe1].
	leftVols := Array new: trackCount.
	rightVols := Array new: trackCount.
	muted  := Array new: trackCount withAll: false.
	rate := 1.0.
	repeat := false.
	tempo := 120.0.

	trackCount = 0 ifTrue: [^ self].
	1 to: trackCount do: [:i |
		leftVols at: i put: ScaleFactor // 4.
		rightVols at: i put: ScaleFactor // 4].

	"distribute inital panning of tracks left-to-right"
	totalVol := 1.0.
	incr := totalVol / (((trackCount // 2) + 1) * 2).
	curr := 0.
	1 to: trackCount do: [:t |
		t even
			ifTrue: [pan := curr]
			ifFalse: [
				curr := curr + incr.
				pan := totalVol - curr].
		self panForTrack: t put: pan].

