cleanup obsolete classes
countReallyObsoleteClassesAndMetaclasses
	"Counting really obsolete classes and metaclasses"

	| metaSize classSize |
	Smalltalk garbageCollect.
	metaSize := self reallyObsoleteMetaclasses size.
	Transcript cr; show: 'Really obsolete metaclasses: ', metaSize printString.
	classSize := self reallyObsoleteClasses size.
	Transcript cr; show: 'Really obsolete classes: ', classSize printString; cr.
	"Metaclasses must correspond to classes!"
	metaSize ~= classSize 
		ifTrue: [self error: 'Serious metalevel inconsistency!!'].