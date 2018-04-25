*SqClassCreation
byteSubclass: aString instVarNames: instVars classVars: anArrayOfClassVars classInstVars: anArrayOfClassInstVars poolDictionaries: anArrayOfPoolDicts inDictionary: aDictionary newVersionOf: oldClass description: aDescription options: optionsArray
  "Creates and returns a new byte subclass of the receiver.  You are not
 permitted to modify the new class after it is created.  If the receiver is not
 some kind of String class, then instances of the new class store and return
 SmallIntegers in the range 0 - 255.

 This method generates an error if instances of the receiver are of special
 storage format, if they are NSCs, or if they have instance variables.

 optionsArray is an Array of Symbols containing zero or more of  
   #noInheritOptions,  #subclassesDisallowed, #disallowGciStore, #modifiable , 
   #traverseByCallback 
 and at most one of 
   #dbTransient, #instancesNonPersistent, #instancesInvariant
 and at most one of the word size definitions for byte format (affects swizzling)
   #'2byteWords' #'4byteWords' #'8byteWords' 
 If present, #noInheritOptions must be the first element and it causes
 none of subclassesDisallowed, disallowGciStore, traverseByCallback,
         dbTransient, instancesNonPersistent, instancesInvariant 
 to be inherited from the superclass, nor copied from the
 current version of the class.

 Returns oldClass if it would be equivalent to the requested new class.
 (See Class(C)>>comment). "

  | hist fmt descr |
  aDictionary
    ifNotNil: [ 
      (aDictionary _validateClass: SymbolDictionary)
        ifFalse: [ ^ nil ] ].
  self isNsc
    ifTrue: [ 
      ^ aString
        _error: #'classErrBadFormat'
        with: 'cannot create byte subclass of Nsc class' ].
  fmt := (format bitAnd: 16r3 bitInvert) bitOr: 16r1 + 16r4.
  descr := aDescription.
  oldClass
    ifNotNil: [ 
      (self
        _equivalentSubclass: oldClass
        superCls: self
        name: aString
        newOpts: optionsArray
        newFormat: fmt
        newInstVars: instVars
        newClassInstVars: anArrayOfClassInstVars
        newPools: anArrayOfPoolDicts
        newClassVars: anArrayOfClassVars
        inDict: aDictionary
        isKernel: false)
        ifTrue: [ 
          oldClass _commentOrDescription: aDescription.
          ^ oldClass	"avoid creation of a new version" ].
      hist := oldClass classHistory.
      descr
        ifNil: [ 
          descr := [ oldClass comment ]
            on: Error
            do: [ :ex | 'old comment not available' ] ] ].
  ^ self
    _subclass: aString
    instVarNames: instVars
    format: fmt
    classVars: anArrayOfClassVars
    classInstVars: anArrayOfClassInstVars
    poolDictionaries: anArrayOfPoolDicts
    inDictionary: aDictionary
    inClassHistory: hist
    description: descr
    options: optionsArray