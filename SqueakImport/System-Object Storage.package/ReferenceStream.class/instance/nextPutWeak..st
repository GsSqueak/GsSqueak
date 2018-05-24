writing
nextPutWeak: anObject
    "Write a weak reference to anObject to the receiver stream. Answer anObject.
     If anObject is not a reference type of object, then just put it normally.
     A 'weak' reference means: If anObject gets written this stream via nextPut:,
     then its weak references will become normal references. Otherwise they'll
     read back as nil. -- "
    | typeID referencePosn |

    "Is it a reference type of object? If not, just write it normally."
    typeID := self typeIDFor: anObject.
    (self isAReferenceType: typeID) ifFalse: [^ self nextPut: anObject].

    "Have we heard of and maybe even written anObject before?"
    referencePosn := references at: anObject ifAbsentPut: [OrderedCollection new].

    "If referencePosn is an Integer, it's the stream position of anObject.
     Else it's a collection of hopeful weak-references to anObject."
    referencePosn isInteger ifFalse:
        [referencePosn add: byteStream position - basePos.		"relative"
        referencePosn := self vacantRef].
    self outputReference: referencePosn.		"relative"

    ^ anObject