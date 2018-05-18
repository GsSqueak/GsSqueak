as yet unclassified
addProjectNameMorph

	| m |

	self removeAllMorphs.
	m := UpdatingStringMorph contents: self safeProjectName font: self fontForName.
	m target: self; getSelector: #safeProjectName; putSelector: #safeProjectName:.
	m useStringFormat; fitContents.
	self addMorphBack: m.
	self updateNamePosition.
	^m

