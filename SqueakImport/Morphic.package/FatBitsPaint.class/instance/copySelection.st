menu
copySelection

        | relativeBounds scaledBounds |
        currentSelectionMorph ifNil: [^ nil].
        relativeBounds := currentSelectionMorph bounds translateBy: self position negated.
        scaledBounds := relativeBounds scaleBy: 1 / magnification.
        FormClipboard := (self unmagnifiedForm copy: scaledBounds).
        ^ relativeBounds