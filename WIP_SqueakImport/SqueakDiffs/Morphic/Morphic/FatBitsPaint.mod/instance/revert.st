menu
revert
"since WarpBits may mangle an 8-bit ColorForm, make it 32 first"
        self form: ((formToEdit asFormOfDepth: 32) 
                magnify: formToEdit boundingBox 
                by: magnification 
                smoothing: 1).
        brush := Pen newOnForm: originalForm.
        brush squareNib: brushSize.
        brush color: brushColor