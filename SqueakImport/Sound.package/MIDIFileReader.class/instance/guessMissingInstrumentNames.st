private
guessMissingInstrumentNames
	"Attempt to guess missing instrument names from the first program change in that track."

	| progChange instrIndex instrName |
	1 to: tracks size do: [:i |
		(trackInfo at: i) isEmpty ifTrue: [
			progChange := (tracks at: i) detect: [:e | e isProgramChange] ifNone: [nil].
			progChange ifNotNil: [
				instrIndex := progChange program + 1.
				instrName := self class standardMIDIInstrumentNames at: instrIndex.
				trackInfo at: i put: instrName]]].
