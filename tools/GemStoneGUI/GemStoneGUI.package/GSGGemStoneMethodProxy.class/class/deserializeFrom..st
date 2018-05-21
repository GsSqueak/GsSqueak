serialization
deserializeFrom: anArray

	^ self new
		inClass: anArray first;
		selector: anArray second;
		envId: anArray third;
		category: anArray fourth;
		yourself