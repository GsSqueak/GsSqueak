accessing
insetColor
  self owner ifNil: [ ^ self color ].
  ^ self colorForInsets