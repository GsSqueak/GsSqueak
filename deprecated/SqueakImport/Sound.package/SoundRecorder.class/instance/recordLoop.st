private
recordLoop
	"Record process loop that records samples."

	| n sampleCount linuxWorkaroundBlock |

	n := 0.
	linuxWorkaroundBlock := Smalltalk os platformName = 'unix'
		ifTrue: [ [ (Delay forMilliseconds: 20) wait ] ]
		ifFalse: [ nil ].
	[
		n = 0 ifTrue: [bufferAvailableSema wait].
		paused
			ifTrue: [
				n := self primRecordSamplesInto: meteringBuffer startingAt: 1.
				self meterFrom: 1 count: n in: meteringBuffer]
			ifFalse: [
				n := self primRecordSamplesInto: currentBuffer startingAt: nextIndex.
				self meterFrom: nextIndex count: n in: currentBuffer.
				nextIndex := nextIndex + n.
				stereo
					ifTrue: [sampleCount := currentBuffer stereoSampleCount]
					ifFalse: [sampleCount := currentBuffer monoSampleCount].
				nextIndex > sampleCount
					ifTrue: [
						self emitBuffer: currentBuffer.
						self allocateBuffer]].

		"workaround for OSS emulation on top on ALSA (on Linux environments)"
		linuxWorkaroundBlock ifNotNil: [ linuxWorkaroundBlock value ] ] repeat
