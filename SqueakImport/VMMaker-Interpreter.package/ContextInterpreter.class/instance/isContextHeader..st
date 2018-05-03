contexts
isContextHeader: aHeader
	<inline: true>
	^ ((aHeader >> 12) bitAnd: 16r1F) = 13			"MethodContext"
		or: [((aHeader >> 12) bitAnd: 16r1F) = 14		"BlockContext"
		or: [((aHeader >> 12) bitAnd: 16r1F) = 4]]	"PseudoContext"