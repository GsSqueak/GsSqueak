-Etoys-customevents-custom events
globalCustomEventNamesFor: aPlayer 
	| _gsSqueakTemp_morph _gsSqueakTemp_names |
	_gsSqueakTemp_morph := aPlayer costume renderedMorph.
	_gsSqueakTemp_names := SortedCollection new.
	self customEventsRegistry
		keysAndValuesDo: [:k :v | (v
					anySatisfy: [:array | _gsSqueakTemp_morph isKindOf: array second])
				ifTrue: [_gsSqueakTemp_names add: k]].
	^ _gsSqueakTemp_names asArray