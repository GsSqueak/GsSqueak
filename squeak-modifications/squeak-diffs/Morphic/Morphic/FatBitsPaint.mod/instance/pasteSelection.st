menu
pasteSelection

        | relativeBounds tempForm |
        currentSelectionMorph ifNil: [^ nil].
        FormClipboard ifNil: [^nil].
        relativeBounds := currentSelectionMorph bounds translateBy: self position negated.
        tempForm := (FormClipboard magnify: FormClipboard boundingBox by: magnification).
        self form
                copy: (relativeBounds origin extent: tempForm boundingBox extent)
                from: 0@0
                in: tempForm
                rule: Form over. 
        self revealPenStrokes