class initialization
installKeyDecodeTable
	"Create a decode table that swaps some keys if 
	Preferences swapControlAndAltKeys is set"
	KeyDecodeTable := Dictionary new.
	Preferences duplicateControlAndAltKeys 
		ifTrue: [ self defaultCrossPlatformKeys do:
				[ :c | self installDuplicateKeyEntryFor: c ] ].
	Preferences swapControlAndAltKeys 
		ifTrue: [ self defaultCrossPlatformKeys do:
				[ :c | self installSwappedKeyEntryFor: c ] ].
	Preferences duplicateAllControlAndAltKeys
		ifTrue: [ (Character allByteCharacters select: [:ea | ea isAlphaNumeric]) do:
				[ :c | self installDuplicateKeyEntryFor: c ] ].
