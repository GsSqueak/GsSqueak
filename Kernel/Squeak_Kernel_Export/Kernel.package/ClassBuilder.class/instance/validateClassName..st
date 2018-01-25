validation
validateClassName: aString
	"Validate the new class name"
	aString first canBeGlobalVarInitial ifFalse:[
		self error: 'Class names must be capitalized'.
		^false].
	environ at: aString ifPresent:[:old|
		(old isKindOf: Behavior) ifFalse:[
			self notify: aString asText allBold, 
						' already exists!\Proceed will store over it.' withCRs]].
	^true