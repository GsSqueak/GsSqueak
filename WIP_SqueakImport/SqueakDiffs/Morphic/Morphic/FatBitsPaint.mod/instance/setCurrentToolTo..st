initialization
setCurrentToolTo: aDictionary

        currentTools := aDictionary.
        currentSelectionMorph ifNotNil: [currentSelectionMorph delete. currentSelectionMorph := nil]