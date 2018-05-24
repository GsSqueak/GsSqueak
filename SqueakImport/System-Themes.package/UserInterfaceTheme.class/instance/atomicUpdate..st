private
atomicUpdate: aBlock
	"Like our Preferences >> #atomicUpdatePreference"
	[
		| original copy returnValue |
		original := properties.
		copy := properties copy.
		returnValue := aBlock value: copy.
		original == properties ifTrue: [
			properties := copy.
			^ returnValue]
	] repeat