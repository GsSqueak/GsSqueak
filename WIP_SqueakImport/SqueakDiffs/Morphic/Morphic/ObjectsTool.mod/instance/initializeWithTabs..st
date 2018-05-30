tabs
initializeWithTabs: tabList
	"Initialize the receiver to have the given tabs"
	| oldPane newPane |
	oldPane := self tabsPane ifNil: [ self searchPane ].
	newPane := (self paneForTabs: tabList)
		setNameTo: 'TabPane';
		yourself.
	newPane layoutFrame: oldPane layoutFrame.
	self replaceSubmorph: oldPane by: newPane.
	newPane layoutChanged; fullBounds.
	self fixLayoutFrames.

