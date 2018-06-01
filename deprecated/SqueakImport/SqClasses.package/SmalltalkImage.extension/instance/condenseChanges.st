*SqClasses-*SqClasses-*SqClasses-housekeeping
condenseChanges
	"Move all the changes onto a compacted sources file."
	"Smalltalk condenseChanges"
	| f oldChanges |
	f := FileStream fileNamed: 'ST80.temp'.
	f header; timeStamp.
	'Condensing Changes File...'
		displayProgressFrom: 0
		to: self classNames size + self traitNames size
		during: [:bar | | count | 
			count := 0.
			self
				allClassesAndTraitsDo: [:classOrTrait | 
					bar value: (count := count + 1).
					classOrTrait moveChangesTo: f.
					classOrTrait putClassCommentToCondensedChangesFile: f.
					classOrTrait classSide moveChangesTo: f]].
	self lastQuitLogPosition: f position.
	f trailer; close.
	oldChanges := SourceFiles at: 2.
	oldChanges close.
	FileDirectory default deleteFileNamed: oldChanges name , '.old';
		 rename: oldChanges name toBe: oldChanges name , '.old';
		 rename: f name toBe: oldChanges name.
	self setMacFileInfoOn: oldChanges name.
	SourceFiles
		at: 2
		put: (FileStream oldFileNamed: oldChanges name)
