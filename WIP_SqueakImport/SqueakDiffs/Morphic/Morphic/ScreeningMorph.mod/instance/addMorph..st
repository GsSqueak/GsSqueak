submorphs-add/remove
addMorph: aMorph

	| f |
	super addMorph: aMorph.
	submorphs size <= 2 ifTrue:
		[self bounds: submorphs last bounds].
	submorphs size = 2 ifTrue:
		["The screenMorph has just been added.
		Choose as the passingColor the center color of that morph"
		f := self screenMorph imageForm.
		passingColor := f colorAt: f boundingBox center.
		passElseBlock := true]