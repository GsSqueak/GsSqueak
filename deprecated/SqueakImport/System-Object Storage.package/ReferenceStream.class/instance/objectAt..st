reading
objectAt: anInteger
    "PRIVATE -- Read & return the object at a given stream position.
     If we already read it, just get it from the objects dictionary.
     (Reading it again wouldn't work with cycles or sharing.)
     If not, go read it and put it in the objects dictionary.
     NOTE: This resolves a cross-reference in the ReferenceStream:
       1. A backward reference to an object already read (the normal case).
       2. A forward reference which is a sated weak reference (we record where
          the object ends so when we get to it normally we can fetch it from
          'objects' and skip over it).
       3. A backward reference to a 'non-reference type' per the long NOTE in
          nextPut: (we compensate here--seek back to re-read it and add the object
          to 'objects' to avoid seeking back to read it any more times).
       4. While reading a foward weak reference (case 2), we may recursively hit an
          ordinary backward reference to an object that we haven't yet read because
          we temporarily skipped ahead. Such a reference is forward in time so we
          treat it much like case 2.
     11/16-24/92 jhm: Handle forward refs. Cf. class comment and above NOTE.
	08:57 tk   anInteger is a relative position"
    
    ^ objects at: anInteger "relative position.  case 1: It's in 'objects'"
        ifAbsent:   "do like super objectAt:, but remember the fwd-ref-end position"
            [| savedPosn refPosn anObject |
		savedPosn := byteStream position.		"absolute"
            refPosn := self getCurrentReference.	"relative position"

            byteStream position: anInteger + basePos.	"was relative"
            anObject := self next.

            (self isAReferenceType: (self typeIDFor: anObject))
                ifTrue:  [fwdRefEnds at: anInteger put: byteStream position - basePos] "cases 2, 4"
                ifFalse: [objects at: anInteger put: anObject]. "case 3"

            self setCurrentReference: refPosn.		"relative position"
            byteStream position: savedPosn.		"absolute"
            anObject]