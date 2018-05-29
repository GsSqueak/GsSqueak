events
mouseMovePaintBrushMode: evt

        | p p2 |
        p := self pointGriddedFromEvent: evt.
        lastMouse = p ifTrue: [^ self].
        lastMouse ifNil: [lastMouse := p].  "first point in a stroke"
        "draw etch-a-sketch style-first horizontal, then vertical"
        p2 := p x@lastMouse y.
        brush drawFrom: lastMouse to: p2.
        brush drawFrom: p2 to: p.
                        
        self revealPenStrokes.
        lastMouse := p