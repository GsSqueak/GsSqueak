scanning
transformAVerticalBarIntoABinarySelector
	"Transform a vertical bar into a binary selector.
	Eventually aggregate a serie of immediately following vertical bars
	and a binary selector.
	Note that this aggregation cannot occur at scan time, because a pair
	of vertical bars can be encountered in two valid constructs:
	- either as an empty temporaries specification,
	- or as a local temporaries specification in a block of arity > 0"
	here := '|'.
	hereType := #binary.
	[tokenType == #verticalBar
		and: [hereMark + here size = mark]]
		whileTrue: [here := here , '|'.
			hereEnd := hereEnd + 1.
			self scanToken].
	(tokenType == #binary
			and: [hereMark + here size = mark])
		ifTrue: [here := here asString , token.
			hereType := #binary.
			hereEnd := hereEnd + token size.
			self scanToken]