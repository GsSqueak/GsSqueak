menu
magnification: aNumber

        | oldPenSize oldForm |
        oldPenSize := brushSize / magnification.
        oldForm := self unmagnifiedForm.
        magnification := aNumber asInteger max: 1.
        self form: (oldForm magnify: oldForm boundingBox by: magnification).
        brush := Pen newOnForm: originalForm.
        self penSize: oldPenSize.
        brush color: brushColor