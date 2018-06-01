sorting
acceptSortedContentsFrom: aHolder 
	"Update my page list from the given page sorter."

	| goodPages rejects |
	goodPages := OrderedCollection new.
	rejects := OrderedCollection new.
	aHolder submorphs doWithIndex: 
			[:m :i | | toAdd sqPage | 
			toAdd := nil.
			(m isKindOf: PasteUpMorph) ifTrue: [toAdd := m].
			(m isKindOf: BookPageThumbnailMorph) 
				ifTrue: 
					[toAdd := m page.
					m bookMorph == self 
						ifFalse: 
							["borrowed from another book. preserve the original"

							toAdd := toAdd veryDeepCopy.

							"since we came from elsewhere, cached strings are wrong"
							self removeProperty: #allTextUrls.
							self removeProperty: #allText]].
			toAdd isString 
				ifTrue: 
					["a url"

					toAdd := pages detect: [:aPage | aPage url = toAdd] ifNone: [toAdd]].
			toAdd isString 
				ifTrue: 
					[sqPage := SqueakPageCache atURL: toAdd.
					toAdd := sqPage contentsMorph 
								ifNil: [sqPage copyForSaving	"a MorphObjectOut"]
								ifNotNil: [sqPage contentsMorph]].
			toAdd ifNil: [rejects add: m] ifNotNil: [goodPages add: toAdd]].
	self newPages: goodPages.
	goodPages isEmpty ifTrue: [self insertPage].
	rejects notEmpty 
		ifTrue: 
			[self 
				inform: rejects size printString , ' objects vanished in this process.']