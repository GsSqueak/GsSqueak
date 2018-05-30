sound generation
reset

	super reset.
	tempo := 120.0.
	self tempoOrRateChanged.
	done := false.
	ticksSinceStart := 0.
	"one index for each sound track, plus one for the ambient track..."
	trackEventIndex := Array new: score tracks size+1 withAll: 1.
	tempoMapIndex := 1.
	activeSounds := OrderedCollection new.
	activeMIDINotes := OrderedCollection new.
	score resetFrom: self.
	overallVolume ifNil: [overallVolume := 0.5].
