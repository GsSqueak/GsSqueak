results
tempNodes
	| tempNodes |
	tempNodes := OrderedCollection new.
	scopeTable
		associationsDo: [:assn | assn value isArray
				ifTrue: [assn value
						do: [:temp | tempNodes add: temp]]
				ifFalse: [assn value isTemp
						ifTrue: [tempNodes add: assn value]]].
	^ tempNodes
		sort: [:n1 :n2 | n1 code <= n2 code]