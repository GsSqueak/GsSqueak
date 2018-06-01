initialization
initialize
	"Initialize a system window. Add label, stripes, etc., if desired"
	super initialize.
	self layoutPolicy: ProportionalLayout new.
	self wantsPaneSplitters: true.
	self layoutInset: ProportionalSplitterMorph gripThickness.
	self cellInset: ProportionalSplitterMorph gripThickness.
	self initializeLabelArea.
	self addCornerGrips.
	self setDefaultParameters.
	allowReframeHandles := true.
	isCollapsed := false.
	paneMorphs := Array new.
	mustNotClose := false.
	updatablePanes := Array new.
	self initializeKeyboardShortcuts