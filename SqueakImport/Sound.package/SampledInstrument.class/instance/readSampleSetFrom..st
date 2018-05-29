other
readSampleSetFrom: dirName
	"Answer a collection of sounds read from AIFF files in the given directory and sorted in ascending pitch order."

	| all dir |
	all := OrderedCollection new.
	dir := FileDirectory default on: dirName.
	dir fileNames do: [:n | | fullName snd |
		fullName := dir fullNameFor: n.
		UIManager default
			informUser: 'Reading AIFF file ', n
			during:
				[snd := LoopedSampledSound new
					fromAIFFFileNamed: fullName
					mergeIfStereo: true].
		all add: snd].
	^ all asArray sort: [:s1 :s2 | s1 pitch < s2 pitch]
