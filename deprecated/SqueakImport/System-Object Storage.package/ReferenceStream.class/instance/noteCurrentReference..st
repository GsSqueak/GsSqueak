reading
noteCurrentReference: typeID
	"PRIVATE -- If we support references for type typeID, remember
	 the current byteStream position so beginReference: can add the
	 next object to the 'objects' dictionary of reference positions,
	 then return true. Else return false."
	| answer |

	(answer := self isAReferenceType: typeID)
		ifTrue: [self setCurrentReference: (byteStream position - 1) - basePos "relative"
				"subtract 1 because we already read the object's type ID byte"].
	^ answer