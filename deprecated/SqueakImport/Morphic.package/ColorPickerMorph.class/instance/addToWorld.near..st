other
addToWorld: world near: box
	| goodLocation |
	goodLocation := self bestPositionNear: box inWorld: world.
	world allMorphsDo:
		[:p | (p isMemberOf: ColorPickerMorph) ifTrue:
		[(p ~~ self and: [p owner notNil and: [p target == target]]) ifTrue:
			[(p selector == selector and: [p argument == argument])
				ifTrue: [^ p comeToFront  "uncover existing picker"]
				ifFalse: ["place second picker relative to first"
						goodLocation := self bestPositionNear: p bounds inWorld: world]]]].
	self position: goodLocation.
	world addMorphFront: self.
	self changed
