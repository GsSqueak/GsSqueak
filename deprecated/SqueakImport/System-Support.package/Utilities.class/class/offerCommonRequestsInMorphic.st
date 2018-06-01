common requests
offerCommonRequestsInMorphic
	"Offer up the common-requests menu.  If the user chooses one, then evaluate it, and -- provided the value is a number or string -- show it in the Transcript."

	"Utilities offerCommonRequests"

	| aMenu  strings |

	(CommonRequestStrings == nil or: [CommonRequestStrings isKindOf: Array])
		ifTrue:
			[self initializeCommonRequestStrings].
	strings := CommonRequestStrings contents.
	aMenu := MenuMorph new.
	aMenu title: 'Common Requests' translated.
	aMenu addStayUpItem.
	strings asString linesDo:
		[:aString |
			aString = '-'
				ifTrue:
					[aMenu addLine]
				ifFalse:
					[aMenu add: (aString ifEmpty: [' ']) target: self selector: #eval: argument: aString]].

	aMenu addLine.
	aMenu add: 'edit this list' translated target: self action: #editCommonRequestStrings.
	aMenu popUpInWorld: self currentWorld