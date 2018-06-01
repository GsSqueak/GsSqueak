as yet unclassified
showMenuFor: aSymbol event: evt

	(aSymbol == #publishProject or: [aSymbol == #publishProjectSimple]) ifTrue: [
		self doPublishButtonMenuEvent: evt.
		^true		"we did show the menu"
	].
	(aSymbol == #findAProject or: [aSymbol == #findAProjectSimple]) ifTrue: [
		self doFindButtonMenuEvent: evt.
		^true		"we did show the menu"
	].
	^false
