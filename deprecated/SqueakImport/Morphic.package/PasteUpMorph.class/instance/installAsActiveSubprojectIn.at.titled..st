WiW support
installAsActiveSubprojectIn: enclosingWorld at: newBounds titled: aString 
    | window howToOpen tm boundsForWorld |
    howToOpen := self embeddedProjectDisplayMode.
    "#scaled may be the only one that works at the moment"
    submorphs do: [:ss | ss owner isNil ifTrue: [ss privateOwner: self]].
    "Transcript that was in outPointers and then got deleted."
    boundsForWorld := howToOpen == #naked ifTrue: [newBounds] ifFalse: [bounds].
    worldState canvas: nil.
    worldState viewBox: boundsForWorld.
    self bounds: boundsForWorld.

    "self viewBox: Display boundingBox."
    "worldState handsDo: [:h | h initForEvents]."
    self installFlaps.

    "SystemWindow noteTopWindowIn: self."
    "self displayWorldSafely."
    howToOpen == #naked ifTrue: [enclosingWorld addMorphFront: self].
    howToOpen == #window 
        ifTrue: 
            [window := (SystemWindow labelled: aString) model: self.
            window addMorph: self frame: (0 @ 0 extent: 1.0 @ 1.0).
            window openInWorld: enclosingWorld].
    howToOpen == #frame 
        ifTrue: 
            [window := (AlignmentMorphBob1 new)
                        minWidth: 100;
                        minHeight: 100;
                        borderWidth: 8;
                        borderColor: Color green;
                        bounds: newBounds.
            window addMorph: self.
            window openInWorld: enclosingWorld].
    howToOpen == #scaled 
        ifTrue: 
            [self position: 0 @ 0.
            window := (EmbeddedWorldBorderMorph new)
                        minWidth: 100;
                        minHeight: 100;
                        borderWidth: 8;
                        borderColor: Color green;
                        bounds: newBounds.
            tm := BOBTransformationMorph new.
            window addMorph: tm.
            tm addMorph: self.
            window openInWorld: enclosingWorld.
            tm changeWorldBoundsToShow: bounds.
            self arrangeToStartSteppingIn: enclosingWorld
            "tm scale: (tm width / self width min: tm height / self height) asFloat."]