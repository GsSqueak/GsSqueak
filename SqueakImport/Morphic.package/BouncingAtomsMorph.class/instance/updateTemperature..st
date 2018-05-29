other
updateTemperature: currentTemperature 
	"Record the current temperature, which is taken to be the number of atoms that have bounced in the last cycle. To avoid too much jitter in the reading, the last several readings are averaged."

	recentTemperatures isNil 
		ifTrue: 
			[recentTemperatures := OrderedCollection new.
			20 timesRepeat: [recentTemperatures add: 0]].
	recentTemperatures removeLast.
	recentTemperatures addFirst: currentTemperature.
	temperature := recentTemperatures sum asFloat / recentTemperatures size