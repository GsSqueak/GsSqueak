accessing
propertyAt: aKey

	^ self propertyDict at: aKey ifAbsent: [nil]