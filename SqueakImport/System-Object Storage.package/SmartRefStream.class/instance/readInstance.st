read write
readInstance
	"Read the contents of an arbitrary instance.
	 ASSUMES: readDataFrom:size: sends me beginReference: after it
	   instantiates the new object but before reading nested objects.
	 NOTE: We must restore the current reference position after
	   recursive calls to next.
Three cases for files from older versions of the system:
1) Class has not changed shape, read it straight.
2) Class has changed instance variables (or needs fixup).  Call a particular method to do it.
3) There is a new class instead.  Find it, call a particular method to read.
	All classes used to construct the structures dictionary *itself* need to be in 'steady' and they must not change!  See setStream:"
	| instSize className refPosn |

	instSize := (byteStream nextNumber: 4) - 1.
	refPosn := self getCurrentReference.
	className := self next asSymbol.
	^ self readInstanceSize: instSize clsname: className refPosn: refPosn
