reading
cleanLine
	"upTo LF or CR, tab as space"

	^stream nextLine ifNotNil: [:line | line replaceAll: Character tab with: Character space]