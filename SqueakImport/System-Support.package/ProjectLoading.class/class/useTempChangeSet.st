utilities
useTempChangeSet
	"While reading the project in, use the temporary change set zzTemp"

	| zz |
	zz := ChangeSet named: 'zzTemp'.
	zz ifNil: [zz := ChangeSet basicNewChangeSet: 'zzTemp'].
	ChangeSet  newChanges: zz.