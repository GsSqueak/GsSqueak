piano rolls
encounteredAtTime: ticks inScorePlayer: scorePlayer atIndex: index inEventTrack: track secsPerTick: secsPerTick

	| nextAmbient m nextDurationInMs program now finalMark thisPage nextPage |

	self gotoMark.
	nextAmbient := nil.
	index to: track size do: [ :i |
		(nextAmbient isNil and: [((m := track at: i) morph) isKindOf: self class]) ifTrue: [
			nextAmbient := m.
		].
	].
	nextAmbient ifNil: [^self].
	nextDurationInMs := (nextAmbient time - ticks * secsPerTick * 1000) rounded.
	finalMark := nextAmbient morph.
	thisPage := self valueOfProperty: #bookPage.
	nextPage := finalMark valueOfProperty: #bookPage.
	(thisPage = nextPage or: [thisPage isNil | nextPage isNil]) ifFalse: [^finalMark gotoMark].
	now := Time millisecondClockValue.
	program := Dictionary new.
	program
		at: #startTime put: now;
		at: #endTime put: now + nextDurationInMs;
		at: #startPoint put: (self valueOfProperty: #cameraPoint);
		at: #endPoint put: (finalMark valueOfProperty: #cameraPoint);
		at: #startZoom put: (self valueOfProperty: #cameraScale);
		at: #endZoom put: (finalMark valueOfProperty: #cameraScale).

	self cameraController setProgrammedMoves: {program}.

