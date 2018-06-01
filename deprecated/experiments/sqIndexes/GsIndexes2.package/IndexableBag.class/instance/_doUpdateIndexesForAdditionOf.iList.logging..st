as yet unclassified
_doUpdateIndexesForAdditionOf: anObject iList: iList logging: doLogging
  "anObject is being added to the receiver.  Update any indexes if necessary.
 Returns true if the index objects were modified correctly; otherwise returns
 an Array containing error information."

  | mapInfo rootTerms i sz num val prevTerm aSet rootObjects |
  rootTerms := iList rootTerms.
  sz := rootTerms size.
  1 to: iList size by: 2 do: [ :j | 
    | indexObj offset indexDict pathTerm |
    "Make a pass through the indexedPaths to see if the receiver participates as a
 set-valued instance variable.  If so, then must update the index dictionary."
    indexObj := iList at: j.
    offset := iList at: j + 1.
    (offset > 1
      _and: [ 
        indexObj isComplete
          _and: [ 
            " get the previous path term (the one with an asterisk) "
            pathTerm := indexObj at: offset - 1.
            pathTerm hasIndexDictionary ] ])
      ifTrue: [ 
        " lazy initialization of aSet (in case we don't ever need it) "
        aSet == nil
          ifTrue: [ aSet := IdentitySet new ].	" only update the dictionary if we haven't already done it "
        (aSet includesIdentical: pathTerm)
          ifFalse: [ 
            aSet add: pathTerm.
            indexDict := indexObj indexDictionary.	" see how many entries exist "
            val := indexDict
              at: self
              term: pathTerm getParentTerm
              otherwise: nil.
            nil == val
              ifTrue: [ indexDict _errorNoEntryForKey: self term: pathTerm getParentTerm value: nil ]
              ifFalse: [ 
                (BucketValueBag _hasInstance: val)
                  ifTrue: [ num := val size ]
                  ifFalse: [ num := 1 ] ].
            num
              timesRepeat: [ 
                " add a dictionary entry for anObject -> NSC "
                indexDict
                  _at: anObject
                  put: self
                  term: pathTerm
                  logging: doLogging ] ] ] ].
  i := 1.
  [ i <= sz and: [ i <= rootTerms size ] ]
    whileTrue: [ 
      | pathTerm |
      " now make a pass through the root path terms "
      (pathTerm := rootTerms at: i) _isObsoletePathTerm
        ifFalse: [ 
          " see if the receiver is participating as a set-valued instance variable "
          pathTerm offset == 1
            ifTrue: [ num := 1 ]
            ifFalse: [ 
              pathTerm hasIndexDictionary
                ifTrue: [ 
                  " get the path term before the set-valued path term "
                  prevTerm := pathTerm getParentTerm.
                  pathTerm indicatesIndexOnNscElements
                    ifFalse: [ prevTerm := prevTerm getParentTerm ].
                  val := pathTerm getIndexDictionary
                    at: self
                    term: prevTerm
                    otherwise: nil.
                  nil == val
                    ifTrue: [ 
                      " if not found, then mappings have already been added "
                      num := 0 ]
                    ifFalse: [ 
                      (BucketValueBag _hasInstance: val)
                        ifTrue: [ num := val size ]
                        ifFalse: [ num := 1 ] ] ]
                ifFalse: [ 
                  "receiver is the '*' for a set valued term"
                  prevTerm := pathTerm indicatesIndexOnNscElements
                    ifTrue: [ pathTerm ]
                    ifFalse: [ pathTerm getParentTerm ].
                  rootObjects := prevTerm findReachableRootsFor: self.
                  pathTerm indicatesIndexOnNscElements
                    ifFalse: [ rootObjects := rootObjects asIdentitySet ] ] ].
          pathTerm indicatesIndexOnNscElements
            ifTrue: [ 
              " if the index is on elements of the NSC, go ahead and update the indexes "
              pathTerm updateBtree
                ifNotNil: [ 
                  (pathTerm _checkBtreeComparisonWith: anObject)
                    ifFalse: [ 
                      | exa |
                      (exa := ImproperOperation new)
                        _number:
                            (ErrorSymbols at: #'rtErrRangeEqualityIndexInvalidClassKindForBtree');
                        args:
                            {(anObject class).
                              (pathTerm name).
                              (pathTerm updateBtree lastElementClassDescription)}.
                      i > 1
                        ifTrue: [ 
                          " indexing objects have been modified, prevent commits "
                          exa signal ]
                        ifFalse: [ 
                          ^ {false.	" indicating no indexing objects were modified "
                          exa} ] ] ].
              pathTerm hasIndexDictionary
                ifTrue: [ num timesRepeat: [ pathTerm addDirectMappingFor: anObject logging: doLogging ] ]
                ifFalse: [ 
                  rootObjects == nil
                    ifTrue: [ 
                      pathTerm
                        addDirectMappingFor: anObject
                        root: anObject
                        nsc: self
                        logging: doLogging ]
                    ifFalse: [ 
                      rootObjects
                        do: [ :root | 
                          pathTerm
                            addDirectMappingFor: anObject
                            root: root
                            nsc: self
                            logging: doLogging ] ] ] ]
            ifFalse: [ 
              (pathTerm _doNotPerformPretraversalFor: anObject)
                ifTrue: [ 
                  " if the path has too many set-valued terms or we're using GsPathTerms, go ahead and update the indexes ... potential for too much or incorrect MappingInfo."
                  rootObjects
                    ifNil: [ num timesRepeat: [ pathTerm addMappingsForObject: anObject logging: doLogging ] ]
                    ifNotNil: [ 
                      rootObjects
                        do: [ :root | pathTerm addMappingsForObject: anObject root: root logging: doLogging ] ] ]
                ifFalse: [ 
                  " get all the mapping info first (this detects any errors
                      along the path before any changes are made to the indexes) "
                  mapInfo := pathTerm
                    getMappingInfoFor: anObject
                    ifObject: nil
                    atOffset: 0
                    replaceWith: nil.	" if the result is not a map info object, it is an Array
                      used for error information "
                  mapInfo class == Array
                    ifTrue: [ 
                      i > 1
                        ifTrue: [ 
                          " indexing objects have been modified, prevent commits "
                          (mapInfo at: 2) signal ].
                      ^ mapInfo ].	" now update dependency lists, index dictionary, B-trees "
                  num
                    timesRepeat: [ mapInfo pathTerm addMappingsUsing: mapInfo logging: doLogging ] ] ] ].
      i := i + 1 ].
  ^ true