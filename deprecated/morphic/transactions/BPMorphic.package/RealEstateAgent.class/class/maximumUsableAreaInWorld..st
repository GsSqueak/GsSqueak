accessing
maximumUsableAreaInWorld: aWorldOrNil
  | _gsSqueakTemp_allowedArea |
  _gsSqueakTemp_allowedArea := Display usableArea.
  aWorldOrNil
    ifNotNil: [ 
      _gsSqueakTemp_allowedArea := _gsSqueakTemp_allowedArea
        intersect: aWorldOrNil visibleClearArea.
      true
        ifTrue: [ 
          (((Smalltalk classNamed: 'Flaps')
            ifNil: [ false ]
            ifNotNil: [ :cls | cls anyFlapsVisibleIn: aWorldOrNil ])
            and: [ self respondsTo: #'reduceByFlaps:' ])
            ifTrue: [ _gsSqueakTemp_allowedArea := self reduceByFlaps: _gsSqueakTemp_allowedArea ] ]	"Smalltalk isMorphic" ].
  ^ _gsSqueakTemp_allowedArea