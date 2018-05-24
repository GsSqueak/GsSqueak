menu
updateInstrumentsFromLibraryExcept: soundsBeingEdited
	"The instrument library has been modified. Update my instruments with the new versions from the library. Use a single instrument prototype for all parts with the same name; this allows the envelope editor to edit all the parts by changing a single sound prototype."

	"soundsBeingEdited is a collection of sounds being edited (by an EnvelopeEditor).  If any of my instruments share one of these, then they will be left alone so as not to disturb that dynamic linkage."

	| unloadPostfix myInstruments name displaysAsUnloaded isUnloaded |
	unloadPostfix := '(out)'.
	myInstruments := Dictionary new.
	1 to: instrumentSelector size do: [:i |
		name := (instrumentSelector at: i) contents.
		displaysAsUnloaded := name endsWith: unloadPostfix.
		displaysAsUnloaded ifTrue: [
			name := name copyFrom: 1 to: name size - unloadPostfix size].
		(myInstruments includesKey: name) ifFalse: [
			myInstruments at: name put:
				(name = 'clink'
					ifTrue: [
						(SampledSound
							samples: SampledSound coffeeCupClink
							samplingRate: 11025) copy]
					ifFalse: [
						(AbstractSound
							soundNamed: name
							ifAbsent: [
								(instrumentSelector at: i) contentsClipped: 'default'.
								FMSound default]) copy])].
		(soundsBeingEdited includes: (scorePlayer instrumentForTrack: i)) ifFalse:
			["Do not update any instrument that is currently being edited"
			scorePlayer instrumentForTrack: i put: (myInstruments at: name)].

		"update loaded/unloaded status in instrumentSelector if necessary"
		isUnloaded := (myInstruments at: name) isKindOf: UnloadedSound.
		(displaysAsUnloaded and: [isUnloaded not])
			ifTrue: [(instrumentSelector at: i) contentsClipped: name].
		(displaysAsUnloaded not and: [isUnloaded])
			ifTrue: [(instrumentSelector at: i) contentsClipped: name, unloadPostfix]].
