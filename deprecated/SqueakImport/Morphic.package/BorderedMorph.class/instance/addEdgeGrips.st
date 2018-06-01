resize handling
addEdgeGrips
	"Add resizers along the four edges of the receiver"

	self
		addMorphBack: (TopGripMorph new target: self;position: self position).
	self
		addMorphBack: (BottomGripMorph new target: self;position: self position).
	self
		addMorphBack: (RightGripMorph new target: self;position: self position).
	self
		addMorphBack: (LeftGripMorph new target: self;position: self position).