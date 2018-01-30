source code management
copyWithTempNames: tempNames
	"Minimal temp name copy that only works for methods containing no temporaries or blocks with arguments.
	Used by the Traits system for creating conflict and required methdos that generate warnings.
	For generic use use copyWithTempsFromMethodNode:"
	| tempString |
	tempString := String streamContents:
					[:str|
					tempNames
						do: [:temp| str nextPutAll: temp]
						separatedBy: [str space].
					str space].
	^self copyWithTrailerBytes: (CompiledMethodTrailer new tempNames: tempString)				
