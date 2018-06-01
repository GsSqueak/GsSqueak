painting
resumeScriptsPausedByPainting
	"If there were any scripts running when painting was initiated, resume them now"

	| aList |
	(aList := self valueOfProperty: #scriptsToResume) isEmptyOrNil ifFalse:
		[aList do:
			[:aScriptInstantiation |
				aScriptInstantiation player costume isInWorld ifTrue:
					[aScriptInstantiation startRunningIfPaused]]].
	self removeProperty: #scriptsToResume