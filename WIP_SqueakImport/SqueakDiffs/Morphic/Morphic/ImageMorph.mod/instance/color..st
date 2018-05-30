accessing
color: aColor
        super color: aColor.
        (image depth = 1 and: [aColor isColor]) ifTrue: [
                image colors: {Color transparent. aColor}.
                self changed]