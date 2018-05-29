menu
cutSelection

        | relativeBounds |
        relativeBounds := self copySelection ifNil: [^ nil].
        originalForm fill: relativeBounds rule: Form over fillColor: Color transparent.
        self revealPenStrokes