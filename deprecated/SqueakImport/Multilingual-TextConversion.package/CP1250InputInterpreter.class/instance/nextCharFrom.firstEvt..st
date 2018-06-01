as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf

	"Input from the Czech keyboard under Windows doesn't correspond to cp-1250 or iso-8859-2 encoding!"

	| keyValue |

	keyValue := evtBuf third.
	^ converter toSqueak: keyValue asCharacter macToSqueak.

