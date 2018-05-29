geometry testing
containsPoint: aPoint

        ^ self bounds containsPoint: aPoint     "even if we are transparent"
