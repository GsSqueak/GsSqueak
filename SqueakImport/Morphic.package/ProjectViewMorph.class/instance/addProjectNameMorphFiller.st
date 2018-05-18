as yet unclassified
addProjectNameMorphFiller

	| m |

	self removeAllMorphs.
	m := AlignmentMorph newRow color: Color transparent.
	self addMorphBack: m.
	m
		on: #mouseDown send: #editTheName: to: self;
		on: #mouseUp send: #yourself to: self.
	self updateNamePosition.

