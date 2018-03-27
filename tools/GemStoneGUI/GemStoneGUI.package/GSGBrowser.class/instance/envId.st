environmentId
envId

	^ (envId isNumber and: [envId >= 0] and: [envId <= 255])
		ifTrue: [envId]
		ifFalse: [0]