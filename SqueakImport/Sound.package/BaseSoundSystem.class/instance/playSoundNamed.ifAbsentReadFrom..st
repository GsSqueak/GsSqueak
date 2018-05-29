playing
playSoundNamed: soundName ifAbsentReadFrom: aifFileName

	(SampledSound soundNames includes: soundName) ifFalse: [
		(FileDirectory default fileExists: aifFileName) ifTrue: [
			SampledSound
				addLibrarySoundNamed: soundName
				fromAIFFfileNamed: aifFileName]].
		
	(SampledSound soundNames includes: soundName) ifTrue: [
		^ SampledSound playSoundNamed: soundName].
	
	^ nil