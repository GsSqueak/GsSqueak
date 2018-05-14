smalltalk-80
asSeconds
	"Return the number of seconds since the Squeak epoch"
	^ (self - (self class epoch offset: offset)) asSeconds