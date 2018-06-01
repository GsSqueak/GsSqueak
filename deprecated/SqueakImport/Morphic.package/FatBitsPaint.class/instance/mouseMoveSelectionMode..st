menu
mouseMoveSelectionMode: evt

        | p |
        p := self pointGriddedFromEvent: evt.
        lastMouse = p ifTrue: [^ self].

        currentSelectionMorph ifNil:
                [currentSelectionMorph := MarqueeMorph new 
                        color: Color transparent;
                        borderWidth: 2;
                        lock.
                self addMorphFront: currentSelectionMorph.
                currentSelectionMorph startStepping].
        currentSelectionMorph 
                bounds: ((Rectangle encompassing: {p. selectionAnchor}) translateBy: self position).

        lastMouse := p