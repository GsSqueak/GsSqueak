keyboard control
displayFiltered: evt 
	| _gsSqueakTemp_matchStr _gsSqueakTemp_allItems _gsSqueakTemp_matches _gsSqueakTemp_feedbackMorph |
	_gsSqueakTemp_matchStr := self valueOfProperty: #matchString.
	_gsSqueakTemp_allItems := self submorphs
				select: [:m | m isKindOf: MenuItemMorph].
	_gsSqueakTemp_matches := _gsSqueakTemp_allItems
				select: [:m | 
					| isMatch |
					isMatch := _gsSqueakTemp_matchStr isEmpty
								or: [m contents includesSubstring: _gsSqueakTemp_matchStr caseSensitive: false].
					m isEnabled: isMatch.
					isMatch].
	_gsSqueakTemp_feedbackMorph := self valueOfProperty: #feedbackMorph.
	_gsSqueakTemp_feedbackMorph
		ifNil: [_gsSqueakTemp_feedbackMorph := TextMorph new autoFit: true;
						 color: Color darkGray.
			self addLine; addMorphBack: _gsSqueakTemp_feedbackMorph lock.
			self setProperty: #feedbackMorph toValue: _gsSqueakTemp_feedbackMorph.
			self fullBounds].
	_gsSqueakTemp_feedbackMorph contents: '<' , _gsSqueakTemp_matchStr , '>'.
	_gsSqueakTemp_matchStr isEmpty
		ifTrue: [_gsSqueakTemp_feedbackMorph delete.
			self submorphs last delete.
			self removeProperty: #feedbackMorph].
	"This method is invoked with evt = nil from MenuMorph >>
	removeMatchString. 
	The current implementation can't select an item without an event."
	(evt notNil
			and: [_gsSqueakTemp_matches size >= 1])
		ifTrue: [self selectItem: _gsSqueakTemp_matches first event: evt]