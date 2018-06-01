accessing
understandsImageFormat
	"Test to see if the image stream format is understood by this decoder.	This should be implemented in each subclass of ImageReadWriter so that	a proper decoder can be selected without ImageReadWriter having to know about all possible image file types."
	| first |
	stream ascii.
	self skipCComments.
	first := (stream next: 7) asString.
	stream binary.
	^ (first = '#define')