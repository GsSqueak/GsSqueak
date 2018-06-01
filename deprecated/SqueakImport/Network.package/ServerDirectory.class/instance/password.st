accessing
password

	passwordHolder ifNil: [passwordHolder := Password new].
	^ passwordHolder passwordFor: self	"may ask the user"