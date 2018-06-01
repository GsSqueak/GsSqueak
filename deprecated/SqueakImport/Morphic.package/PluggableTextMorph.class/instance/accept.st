menu commands
accept 
	"Inform the model of text to be accepted, and return true if OK."

	| priorSelection priorScrollerOffset |

	(self canDiscardEdits and: [(self hasProperty: #alwaysAccept) not])
		ifTrue: [^ self flash].

	self hasEditingConflicts ifTrue: [
		(self confirm: 'Caution! This method may have been\changed elsewhere since you started\editing it here.  Accept anyway?' withCRs translated) ifFalse: [^ self flash]].

	priorSelection := self selectionInterval copy.
	priorScrollerOffset := scroller offset copy.
	
	self acceptTextInModel == true
		ifFalse: [^ self "something went wrong"].
		
	self setText: self getText.
	self hasUnacceptedEdits: false.

	(model dependents
		detect: [:dep | (dep isKindOf: PluggableTextMorph) and: [dep getTextSelector == #annotation]]
		ifNone: [nil])
			ifNotNil: [:aPane | model changed: #annotation].

	"Update the model's internal caches. Note that this is specific to CodeHolder and the stepping it uses for updating. We have to trigger this here manually to avoid that the next step message destroys our selection and scrolling offset."
	(model respondsTo: #updateCodePaneIfNeeded)
		ifTrue: [model updateCodePaneIfNeeded].
	
	"Restore prior selection:"
	scroller offset: priorScrollerOffset.
	selectionInterval := priorSelection.
	self selectFrom: priorSelection first to: priorSelection last.