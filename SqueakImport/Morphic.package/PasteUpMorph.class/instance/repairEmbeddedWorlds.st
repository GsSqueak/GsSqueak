world state
repairEmbeddedWorlds

	| toDoList |

	toDoList := OrderedCollection new.
	self allMorphsDo: [ :each | | transform eWorld |
		(each isKindOf: EmbeddedWorldBorderMorph) ifTrue: [
			transform := each submorphs at: 1 ifAbsent: [nil].
			transform ifNotNil: [
				eWorld := transform submorphs at: 1 ifAbsent: [nil].
				eWorld ifNotNil: [
					toDoList add: {transform. eWorld}.
				].
			].
			"Smalltalk at: #Q put: {self. each. transform. eWorld}."
		].
	].
	toDoList do: [ :each |
		each first addMorph: each second.
	].