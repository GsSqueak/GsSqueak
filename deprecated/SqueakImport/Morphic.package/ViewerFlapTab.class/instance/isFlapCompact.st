compact
isFlapCompact
	"Return true if the referent of the receiver represents a 'compact' flap"
	referent layoutPolicy ifNil:[^false].
	referent layoutPolicy isTableLayout ifFalse:[^false].
	referent vResizing == #shrinkWrap ifFalse:[^false].
	^true