*System-Object Events-accessing-removing
removeActionsSatisfying: aOneArgBlock 
forEvent: anEventSelector

    self
        setActionSequence:
            ((self actionSequenceForEvent: anEventSelector)
                reject: aOneArgBlock)
        forEvent: anEventSelector