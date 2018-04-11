halos and balloon help
wantsDirectionHandles
	^ self
		valueOfProperty: #wantsDirectionHandles
		ifAbsent: [Preferences showDirectionHandles
				or: [Preferences showDirectionForSketches]]