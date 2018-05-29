*System-Object Events-accessing-removing
removeActionsWithReceiver: anObject
forEvent: anEventSelector

    self
        removeActionsSatisfying:
            [:anAction |
            anAction receiver == anObject]
        forEvent: anEventSelector