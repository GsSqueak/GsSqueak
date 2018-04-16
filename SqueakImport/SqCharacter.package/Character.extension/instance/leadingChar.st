*SqCharacter-accessing
leadingChar
	"Answer the value of the 8 highest bits which is used to identify the language.
	This is mostly used for east asian languages CJKV as a workaround against unicode han-unification."
	^ self asInteger bitShift: -22
