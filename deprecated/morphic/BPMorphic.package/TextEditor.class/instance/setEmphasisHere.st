typing support
setEmphasisHere
	emphasisHere := (paragraph text
				attributesAt: (self pointIndex - 1 max: 1)
				forStyle: paragraph textStyle)
				select: [:att | att mayBeExtended]