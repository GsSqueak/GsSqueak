events
mouseDownSelection: evt

        lastMouse := nil.
        currentSelectionMorph ifNotNil: [currentSelectionMorph delete. currentSelectionMorph := nil].
        selectionAnchor := self pointGriddedFromEvent: evt