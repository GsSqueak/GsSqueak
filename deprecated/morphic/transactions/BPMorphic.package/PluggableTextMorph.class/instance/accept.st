menu commands
accept
	"Inform the model of text to be accepted, and return true if OK."
	| _gsSqueakTemp_priorSelection _gsSqueakTemp_priorScrollerOffset |
	(self canDiscardEdits
			and: [(self hasProperty: #alwaysAccept) not])
		ifTrue: [^ self flash].
	self hasEditingConflicts
		ifTrue: [(self confirm: 'Caution! This method may have been\changed elsewhere since you started\editing it here.  Accept anyway?' withCRs translated)
				ifFalse: [^ self flash]].
	_gsSqueakTemp_priorSelection := self selectionInterval copy.
	_gsSqueakTemp_priorScrollerOffset := scroller offset copy.
	self acceptTextInModel == true
		ifFalse: [^ self"something went wrong"].
	self setText: self getText.
	self hasUnacceptedEdits: false.
	(model dependents
		detect: [:dep | (dep isKindOf: PluggableTextMorph)
				and: [dep getTextSelector == #annotation]]
		ifNone: [])
		ifNotNil: [:aPane | model changed: #annotation].
	"Update the model's internal caches. Note that this is specific to
	CodeHolder and the stepping it uses for updating. We have to trigger
	this here manually to avoid that the next step message destroys our
	selection and scrolling offset."
	(model respondsTo: #updateCodePaneIfNeeded)
		ifTrue: [model updateCodePaneIfNeeded].
	"Restore prior selection:"
	scroller offset: _gsSqueakTemp_priorScrollerOffset.
	selectionInterval := _gsSqueakTemp_priorSelection.
	self selectFrom: _gsSqueakTemp_priorSelection first to: _gsSqueakTemp_priorSelection last