*SqCollectionLiterals-private
replaceFrom: startIndex to: stopIndex with: aSeqCollection startingAt: repIndex

"Replaces the elements of the receiver between the indexes startIndex and
 stopIndex inclusive with the elements of aSeqCollection starting at repIndex.
 If aSeqCollection is identical to the receiver, the source and
 destination blocks may overlap.

 The primitive supports directly the case where 
    (aSeqCollection isKindOfClass: CByteArray) == true , 
 with repIndex being one-based .

 Returns the receiver."

<primitive: 297> "GemStone Primitive"
startIndex _isSmallInteger ifFalse:[ startIndex _validateClass: SmallInteger ].
stopIndex _isSmallInteger ifFalse:[ stopIndex _validateClass: SmallInteger ].
repIndex _isSmallInteger ifFalse:[ repIndex _validateClass: SmallInteger ].

^ super replaceFrom: startIndex to: stopIndex with: aSeqCollection startingAt: repIndex

