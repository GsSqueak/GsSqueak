instance creation
allCharacters
	"return a set containing all byte characters"

	^ self fromMap: (ByteArray new: 256 withAll: 1)