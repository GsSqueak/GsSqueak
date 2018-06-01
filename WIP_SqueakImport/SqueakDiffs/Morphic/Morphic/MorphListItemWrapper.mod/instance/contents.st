accessing
contents
	"Answer the receiver's contents"

	| tentative submorphs |
	tentative := item submorphs
				collect: [:each | each renderedMorph].

	submorphs := Preferences noviceMode
				ifTrue: [
					tentative
						reject: [:each |
							each isSystemWindow
								or: [each isDockingBar
								or: [(each isKindOf: HaloMorph)
								or: [(each hasProperty: #morphHierarchy)
								or: [each isFlapOrTab
								or: [each isObjectsTool]]]]]]]
				ifFalse: [
					tentative
						reject: [:each | each isKindOf: HaloMorph]].

	^ submorphs
		collect: [:each | self class with: each]