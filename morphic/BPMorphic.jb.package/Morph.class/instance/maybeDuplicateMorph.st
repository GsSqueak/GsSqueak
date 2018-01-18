meta-actions
maybeDuplicateMorph	"Maybe duplicate the morph"	self okayToDuplicate		ifTrue: [self topRendererOrSelf duplicate openInHand]