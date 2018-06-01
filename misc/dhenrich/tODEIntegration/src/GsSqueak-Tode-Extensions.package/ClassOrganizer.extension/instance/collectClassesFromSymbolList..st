*gssqueak-tode-extensions
collectClassesFromSymbolList: aSymbolList
  "Rebuilds the class hierarchy structure from the given SymbolList."

  | allClasses symlist dict rootIsObj done rootHist |
  allClasses := ClassSet new.	" make a list of all the named classes "
  symlist := Array withAll: aSymbolList.
  rootIsObj := (aSymbolList objectNamed: rootClass name) == rootClass.
  rootIsObj
    ifTrue: [ rootHist := IdentitySet new ]
    ifFalse: [ 
      rootHist := IdentitySet withAll: rootClass classHistory.
      rootHist remove: rootClass ].
  done := IdentitySet new.
  [ symlist size > 0 ]
    whileTrue: [ 
      dict := symlist at: 1.
      (done includesIdentical: dict)
        ifFalse: [ 
          dict
            valuesDo: [ :aValue | 
              | anObj |
              anObj := aValue.
              anObj isBehavior
                ifTrue: [ 
                  anObj isMeta
                    ifTrue: [ anObj := anObj thisClass ].
                  (rootIsObj
                    or: [ (anObj _subclassOf: rootClass) or: [ rootHist includes: anObj ] ])
                    ifTrue: [ allClasses add: anObj ] ] ].
          done add: dict ].
      symlist removeFrom: 1 to: 1 ].
  rootIsObj
    ifFalse: [ 
      | cls |
      "now add superclasses up to object"
      cls := rootClass superclass.
      [ cls ~~ nil ]
        whileTrue: [ 
          allClasses add: cls.
          cls := cls superclass ] ].
  classes := allClasses