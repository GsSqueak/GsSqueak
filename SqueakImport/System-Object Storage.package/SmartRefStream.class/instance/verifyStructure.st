read write
verifyStructure
	"Compare the incoming inst var name lists with the existing classes.  Prepare tables that will help to restructure those who need it (renamed, reshaped, steady).    If all superclasses are recorded in the file, only compare inst vars of this class, not of superclasses.  They will get their turn.  "


	| converting |

	self flag: #bobconv.	

	converting := OrderedCollection new.
	structures keysDo: [:nm "an old className (symbol)" | | newClass newList oldList |
		"For missing classes, there needs to be a method in SmartRefStream like 
			#rectangleoc2 that returns the new class."
		newClass := self mapClass: nm.	   "does (renamed at: nm put: newClass name)"
		newClass isString ifTrue: [^ newClass].  "error, fileIn needed"
		newList := (Array with: newClass classVersion), (newClass allInstVarNames).
		oldList := structures at: nm.
		newList = oldList 
			ifTrue: [steady add: newClass]  "read it in as written"
			ifFalse: [converting add: newClass name]
	].
	false & converting isEmpty not ifTrue: ["debug" 
			self inform: 'These classes are being converted from existing methods:\' withCRs,
				converting asArray printString].
