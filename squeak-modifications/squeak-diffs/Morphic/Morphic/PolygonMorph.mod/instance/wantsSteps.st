testing
wantsSteps
	super wantsSteps ifTrue: [^true].

	"For crawling ants effect of dashed line."
	borderDashSpec ifNil: [^false].
	^borderDashSpec size = 5 and: [(borderDashSpec fifth) > 0]