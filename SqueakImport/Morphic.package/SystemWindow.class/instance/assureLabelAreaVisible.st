layout
assureLabelAreaVisible
	"Label should be visible to interact with."

	(RealEstateAgent maximumUsableAreaInWorld: self world) in: [:rect |
		 self innerBounds top < rect top ifTrue: [self top: rect top]].