controls
atTrack: trackIndex from: aPopUpChoice selectInstrument: selection 
	| oldSnd name snd |
	oldSnd := scorePlayer instrumentForTrack: trackIndex.
	(selection beginsWith: 'edit ') 
		ifTrue: 
			[name := selection copyFrom: 6 to: selection size.
			aPopUpChoice contentsClipped: name.
			(oldSnd isKindOf: FMSound) | (oldSnd isKindOf: LoopedSampledSound) 
				ifTrue: [EnvelopeEditorMorph openOn: oldSnd title: name].
			(oldSnd isKindOf: SampledInstrument) 
				ifTrue: [EnvelopeEditorMorph openOn: oldSnd allNotes first title: name].
			^self].
	snd := nil.
	1 to: instrumentSelector size
		do: 
			[:i | 
			(trackIndex ~= i and: [selection = (instrumentSelector at: i) contents]) 
				ifTrue: [snd := scorePlayer instrumentForTrack: i]].	"use existing instrument prototype"
	snd ifNil: 
			[snd := (selection = 'clink' 
				ifTrue: 
					[(SampledSound samples: SampledSound coffeeCupClink
								samplingRate: 11025) ]
				ifFalse: [(AbstractSound soundNamed: selection)]) copy].
	scorePlayer instrumentForTrack: trackIndex put: snd.
	(instrumentSelector at: trackIndex) contentsClipped: selection