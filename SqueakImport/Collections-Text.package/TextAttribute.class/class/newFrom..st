instance creation
newFrom: scanStream
	"scanStream contains a class identifier character possibly followed by data"
	| cls |
	cls := self classFor: scanStream peek.
	cls consumeIdentifierFrom: scanStream.
	^cls scanFrom: scanStream