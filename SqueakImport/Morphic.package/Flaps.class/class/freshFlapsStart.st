flap mechanics
freshFlapsStart
	"To be called manually only, as a drastic measure.  Delete all flap artifacts and establish fresh default global flaps
	Flaps freshFlapsStart
	"
	self currentWorld deleteAllFlapArtifacts.
	self clobberFlapTabList.
	self addStandardFlaps
