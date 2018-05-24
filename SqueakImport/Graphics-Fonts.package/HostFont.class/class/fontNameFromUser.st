accessing
fontNameFromUser
	"HostFont fontNameFromUser"
	| fontNames index labels |
	fontNames := self listFontNames sort.
	labels := WriteStream on: (String new: 100).
	fontNames do:[:fn| labels nextPutAll: fn] separatedBy:[labels cr].
	index := (UIManager default chooseFrom: (labels contents substrings) title: 'Choose your font').
	index = 0 ifTrue:[^nil].
	^fontNames at: index