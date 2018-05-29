drawing
addNotes
	"Recompute the set of morphs that should be visible at the current scroll position."

	| visibleMorphs rightEdge topEdge rightEdgeTime |
	visibleMorphs := OrderedCollection new: 500.
	rightEdge := self right - borderWidth.
	rightEdgeTime := self timeForX: rightEdge.
	topEdge := self top + borderWidth + 1.

	"Add ambient morphs first (they will be front-most)"
	score eventMorphsWithTimeDo:
		[:m :t | m addMorphsTo: visibleMorphs pianoRoll: self eventTime: t
					betweenTime: leftEdgeTime and: rightEdgeTime].

	"Then add note morphs"
	score tracks withIndexDo:
		[:track :trackIndex | | done n i nRight nTop nLeft trackColor |
		trackColor := colorForTrack at: trackIndex.
		i := indexInTrack at: trackIndex.
		done := scorePlayer mutedForTrack: trackIndex.
		[done | (i > track size)] whileFalse: [
			n := track at: i.
			(n isNoteEvent and: [n midiKey >= lowestNote]) ifTrue: [
				n time > rightEdgeTime
					ifTrue: [done := true]
					ifFalse: [
						nLeft := self xForTime: n time.
						nTop := (self yForMidiKey: n midiKey) - 1.
						nTop > topEdge ifTrue: [
							nRight := nLeft + (n duration * timeScale) truncated - 1.
							visibleMorphs add:
								((PianoRollNoteMorph
									newBounds: (nLeft@nTop corner: nRight@(nTop + 3))
									color: trackColor)
									trackIndex: trackIndex indexInTrack: i)]]].
			i := i + 1].
			(selection notNil
				and: [trackIndex = selection first
				and: [i >= selection second and: [(indexInTrack at: trackIndex) <= selection third]]])
				ifTrue: [visibleMorphs do:
						[:vm | (vm isKindOf: PianoRollNoteMorph) ifTrue: [vm selectFrom: selection]]]].

	"Add the cursor morph in front of all notes; height and position are set later."
	cursor ifNil: [cursor := Morph newBounds: (self topLeft extent: 1@1) color: Color red].
	visibleMorphs addFirst: cursor.

	self changed.
	self removeAllMorphs.
	self addAllMorphs: visibleMorphs.
