common requests
offerCommonRequests
	"Offer up the common-requests menu.  If the user chooses one, then evaluate it, and -- provided the value is a number or string -- show it in the Transcript."

	"Utilities offerCommonRequests"

	| reply result index normalItemCount strings lines |

	Smalltalk isMorphic ifTrue: [^ self offerCommonRequestsInMorphic].

	(CommonRequestStrings == nil or: [CommonRequestStrings isKindOf: Array])
		ifTrue:
			[self initializeCommonRequestStrings].
	
	strings := CommonRequestStrings contents.
	lines := strings asString lines copyWith: 'edit this menu'.
	normalItemCount := lines size - 1.
	
	index := UIManager default 
		chooseFrom: lines
		lines: (Array with: normalItemCount).

	index = 0 ifTrue: [^ self].
	index > normalItemCount ifTrue:
		[^ self editCommonRequestStrings].

	reply := lines at: index.
	reply size = 0 ifTrue: [^ self].

	result := Compiler evaluate: reply.
	(result isNumber) | (result isString)
		ifTrue:
			[Transcript cr; nextPutAll: result printString]