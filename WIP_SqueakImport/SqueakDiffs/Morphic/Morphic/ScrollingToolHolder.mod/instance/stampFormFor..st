accessing
stampFormFor: aButton

	| which |
	which := stampButtons indexOf: aButton ifAbsent: [1].
	^ stamps atWrap: which+start-1