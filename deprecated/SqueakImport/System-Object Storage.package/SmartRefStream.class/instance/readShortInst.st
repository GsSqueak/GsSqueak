read write
readShortInst
	"Instance has just one byte of size.  Class symbol is encoded in two bytes of file position.  See readInstance."
	| instSize className refPosn |

	instSize := (byteStream next) - 1.	"one byte of size"
	refPosn := self getCurrentReference.
	className := self readShortRef.	"class symbol in two bytes of file pos"
	^ self readInstanceSize: instSize clsname: className refPosn: refPosn
