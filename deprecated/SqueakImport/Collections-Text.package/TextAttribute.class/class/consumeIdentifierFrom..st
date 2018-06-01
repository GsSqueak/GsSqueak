fileIn/Out
consumeIdentifierFrom: scanStream.
	"When scanning, a subclass may require access to the identifier character.
	Otherwise, consume it here."
	scanStream next