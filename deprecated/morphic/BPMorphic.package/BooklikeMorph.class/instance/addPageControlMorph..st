page controls
addPageControlMorph: aMorph 
	"Add the morph provided as a page control, at the appropriate place"
	aMorph setProperty: #pageControl toValue: true.
	self addMorph: aMorph asElementNumber: self indexForPageControls