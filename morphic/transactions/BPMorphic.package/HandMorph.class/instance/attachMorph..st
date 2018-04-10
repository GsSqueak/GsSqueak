grabbing/dropping
attachMorph: m 
	"Position the center of the given morph under this hand, then grab it.
	This method is used to grab far away or newly created morphs."
	| _gsSqueakTemp_delta |
	self releaseMouseFocus.
	"Break focus"
	_gsSqueakTemp_delta := m bounds extent // 2.
	m position: self position - _gsSqueakTemp_delta.
	m formerPosition: m position.
	targetOffset := m position - self position.
	self addMorphBack: m