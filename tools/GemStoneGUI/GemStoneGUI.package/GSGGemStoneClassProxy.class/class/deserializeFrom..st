serialization
deserializeFrom: anArray

	^ self new
		name: anArray first;
		isMeta: anArray second;
		yourself