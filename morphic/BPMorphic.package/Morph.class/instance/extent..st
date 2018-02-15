as yet unclassified
extent: aPoint
  (bounds extent closeTo: aPoint)
    ifTrue: [ ^ self ].
  self changed.
  bounds := bounds topLeft extent: aPoint.
  self removeProperty: #'dropShadow'.
  self layoutChanged.
  self changed	"Widgets: Emit extent change."