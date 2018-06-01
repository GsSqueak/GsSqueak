as yet unclassified
occurAtTime: ticks inScorePlayer: player atIndex: index inEventTrack: track secsPerTick: secsPerTick
	(target == nil or: [selector == nil]) ifTrue:
		[morph ifNil: [^ self].
		^ morph encounteredAtTime: ticks inScorePlayer: player atIndex: index
				inEventTrack: track secsPerTick: secsPerTick].
	target perform: selector withArguments: arguments