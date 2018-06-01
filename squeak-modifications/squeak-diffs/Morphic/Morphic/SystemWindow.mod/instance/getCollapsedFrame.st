resize/collapse
getCollapsedFrame

	| tmp |
	^Preferences collapseWindowsInPlace 
		ifTrue:
			[tmp := self getBoundsWithFlex.
			tmp origin corner: (tmp corner x @ 18)]
		ifFalse:
			[RealEstateAgent assignCollapseFrameFor: self]