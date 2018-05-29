positioning
positionObject: anObject atEdgeOf: container
        "anObject could be myself or my referent"

        edgeToAdhereTo == #left ifTrue: [^ anObject left: container left].
        edgeToAdhereTo == #right ifTrue: [^ anObject right: container right].
        edgeToAdhereTo == #top ifTrue: [^ anObject top: container top].
        edgeToAdhereTo == #bottom ifTrue: [^ anObject bottom: container bottom]