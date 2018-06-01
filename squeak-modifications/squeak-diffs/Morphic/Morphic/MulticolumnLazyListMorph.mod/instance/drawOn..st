drawing
drawOn: aCanvas
        self getListSize = 0 ifTrue:[ ^self ].

        self setColumnWidthsFor: aCanvas.

        super drawOn: aCanvas