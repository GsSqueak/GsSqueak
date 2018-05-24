dnd requests
requestDropStream: dropIndex
	"Request a read-only stream for some file that was dropped onto Squeak"
	^self concreteStream new requestDropStream: dropIndex.