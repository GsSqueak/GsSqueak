serialization
deserializeFrom: anArray

	^ self new
		className: anArray first;
		selector: anArray second;
		classIsMeta: anArray third;
		envId: anArray fourth;
		category: anArray fifth;
		sourceString: anArray sixth;
		yourself