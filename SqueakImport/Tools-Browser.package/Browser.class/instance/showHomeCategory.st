message category functions
showHomeCategory
	"Select the category of the currently-selected method.  If it is already selected, or if no method is selected, deselect it to unfilter the message list."
	self okToChange ifTrue:
		[ | aSelector | ((aSelector := self selectedMessageName) notNil or: [ selectedMessageCategoryName notNil ]) ifTrue:
			[ aSelector
				ifNil: [ self selectMessageCategoryNamed: nil ]
				ifNotNil: [ self toggleCategorySelectionForCurrentMethod ].
			self selectedMessageName: aSelector ] ]