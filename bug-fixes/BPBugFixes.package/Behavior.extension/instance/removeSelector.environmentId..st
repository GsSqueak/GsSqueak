*BPBugFixes
removeSelector: aString environmentId: envId
  "Removes the method whose selector is aString from the receiver's method
 dictionary.  If the selector is not in the method dictionary, generates an
 error."

  | selector removedFromBaseDict |
  self _validatePrivilege
    ifFalse: [ ^ nil ].
  selector := Symbol _existingWithAll: aString.
  selector
    ifNotNil: [ 
      removedFromBaseDict := envId == 0
        ifTrue: [ self _basicRemoveSelector: selector environmentId: envId ]
        ifFalse: [ self __basicRemoveSelector: selector environmentId: envId ].
      removedFromBaseDict
        ifTrue: [ 
          | cDict |
          cDict := self _baseCategorys: envId.
          cDict
            keysAndValuesDo: [ :aKey :setOfSelectors | (setOfSelectors remove: selector otherwise: nil) ifNotNil: [ ^ self	"done" ] ].
          ^ self _error: #'classErrSelectorNotFound' args: {aString} ] ]
    ifNil: [ ^ self _error: #'classErrSelectorNotFound' args: {aString} ]