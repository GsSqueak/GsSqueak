release
removeChangeSetIfPossible

	| itsName |

	changeSet ifNil: [^self].
	changeSet isEmpty ifFalse: [^self].
	(changeSet projectsBelongedTo copyWithout: self) isEmpty ifFalse: [^self].
	itsName := changeSet name.
	ChangeSet removeChangeSet: changeSet.
	"Transcript cr; show: 'project change set ', itsName, ' deleted.'"
