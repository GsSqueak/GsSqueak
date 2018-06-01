as yet unclassified
acceptSort
	"Reconstitute the palette based on what is found in the sorter"

	| rejects oldOwner tabsToUse oldTop |
	tabsToUse := OrderedCollection new.
	rejects := OrderedCollection new.
	pageHolder submorphs doWithIndex: 
			[:m :i | | appearanceMorph toAdd aMenu | 
			toAdd := nil.
			(m isKindOf: BookMorph) ifTrue: [toAdd := SorterTokenMorph forMorph: m].
			(m isKindOf: SorterTokenMorph) 
				ifTrue: 
					[toAdd := m morphRepresented.
					(toAdd referent isKindOf: MenuMorph) 
						ifTrue: 
							[(aMenu := toAdd referent) setProperty: #paletteMenu toValue: true.
							(aMenu submorphs size > 1 and: 
									[(aMenu submorphs second isKindOf: MenuItemMorph) 
										and: [aMenu submorphs second contents = 'dismiss this menu']]) 
								ifTrue: 
									[aMenu submorphs first delete.	"delete title"
									aMenu submorphs first delete.	"delete stay-up item"
									(aMenu submorphs first knownName = #line) 
										ifTrue: [aMenu submorphs first delete]]].
					toAdd removeAllMorphs.
					toAdd addMorph: (appearanceMorph := m submorphs first).
					appearanceMorph position: toAdd position.
					appearanceMorph lock.
					toAdd fitContents].
			toAdd ifNil: [rejects add: m] ifNotNil: [tabsToUse add: toAdd]].
	tabsToUse isEmpty 
		ifTrue: [^self inform: 'Sorry, must have at least one tab'].
	book newTabs: tabsToUse.
	book tabsMorph color: pageHolder color.
	oldTop := self topRendererOrSelf.	"in case some maniac has flexed the sorter"
	oldOwner := oldTop owner.
	oldTop delete.
	oldOwner addMorphFront: book