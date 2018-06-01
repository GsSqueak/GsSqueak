*System-Object Events-accessing-triggering
triggerEvent: anEventSelector
withArguments: anArgumentList

    ^(self actionForEvent: anEventSelector)
        valueWithArguments: anArgumentList