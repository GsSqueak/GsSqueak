reading
next
	"Answer the next object in the stream.  If this object was already read, don't re-read it.  File is positioned just before the object."
	| curPosn skipToPosn haveIt theObject wasSkipping |

	haveIt := true.
	curPosn := byteStream position - basePos.
	theObject := objects at: curPosn ifAbsent: [haveIt := false].
		"probe in objects is done twice when coming from objectAt:.  This is OK."
	skipToPosn := fwdRefEnds at: curPosn ifAbsent: [nil].
	haveIt ifFalse: [ ^ super next].

	skipToPosn ifNotNil: [
		"Skip over the object and return the already-read-in value."
		byteStream position: skipToPosn + basePos		"make absolute"
	] ifNil: [
		"File is not positioned correctly.  Read object and throw it away."
		wasSkipping := skipping includes: curPosn.
		skipping add: curPosn.
		"fake :=" super next.
		wasSkipping ifFalse: [skipping remove: curPosn ifAbsent: []].
	].
	^ theObject
		