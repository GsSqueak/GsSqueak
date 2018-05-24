initialization
list: listOfStrings  
	"lex doesn't think this is used any longer, but is not yet brave enough to remove it.  It should be removed eventually"
	
	
	"Set the receiver's list as specified"

	| morphList h index converter aSelector textColor font loc |
self isThisEverCalled.
	scroller removeAllMorphs.
	list := listOfStrings ifNil: [Array new].
	list isEmpty ifTrue: [self setScrollDeltas.  ^ self selectedMorph: nil].
	"NOTE: we will want a quick StringMorph init message, possibly even
		combined with event install and positioning"
	font ifNil: [font := Preferences standardListFont].
	converter := self valueOfProperty: #itemConversionMethod.
	converter ifNil: [converter := #asStringOrText].
	textColor := self valueOfProperty: #textColor.
	morphList := list collect: [:each | | stringMorph item |
		item := each.
		item := item perform: converter.
		stringMorph := item isText
			ifTrue: [StringMorph contents: item font: font emphasis: (item emphasisAt: 1)]
			ifFalse: [StringMorph contents: item font: font].
		textColor ifNotNil: [ stringMorph color: textColor ].
		stringMorph
	].
	
	(aSelector := self valueOfProperty: #balloonTextSelectorForSubMorphs)
		ifNotNil:
			[morphList do: [:m | m balloonTextSelector: aSelector]].

	self highlightSelector ifNotNil:
		[model perform: self highlightSelector with: list with: morphList].

	"Lay items out vertically and install them in the scroller"
	h := morphList first height "self listItemHeight".
	loc := 0@0.
	morphList do: [:m | m bounds: (loc extent: 9999@h).  loc := loc + (0@h)].
	scroller addAllMorphs: morphList.

	index := self getCurrentSelectionIndex.
	self selectedMorph: ((index = 0 or: [index > morphList size]) ifTrue: [nil] ifFalse: [morphList at: index]).
	self setScrollDeltas.
	scrollBar setValue: 0.0