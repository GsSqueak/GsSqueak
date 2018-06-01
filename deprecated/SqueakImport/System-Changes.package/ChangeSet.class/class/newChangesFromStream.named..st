services
newChangesFromStream: aStream named: aName
	"File in the code from the stream into a new change set whose
	name is derived from aName. Leave the 'current change set'
	unchanged. Return the new change set or nil on failure."

	| oldChanges newName newSet |
	oldChanges := ChangeSet current.
	PreviousSet := oldChanges name. 		"so a Bumper update can find it"
	newName := aName sansPeriodSuffix.
	newSet := self basicNewChangeSet: newName.
	[ | newStream |newSet ifNotNil:[
		(aStream respondsTo: #converter:) ifFalse: [
			newStream := MultiByteBinaryOrTextStream with: (aStream contentsOfEntireFile).
			newStream reset.
		] ifTrue: [
			newStream := aStream.
		].

		self newChanges: newSet.
		newStream setConverterForCode.
		newStream fileInAnnouncing: 'Loading ', newName, '...'.
		Transcript cr; show: 'File ', aName, ' successfully filed in to change set ', newName].
	aStream close] ensure: [self newChanges: oldChanges].
	PreviousSet := nil.
	^ newSet