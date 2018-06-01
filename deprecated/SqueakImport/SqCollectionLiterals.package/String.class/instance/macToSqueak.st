internet
macToSqueak
	"Convert the receiver from MacRoman to Squeak encoding"
	^ self collect: [:each | each macToSqueak]
