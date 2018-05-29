accessing
wordAt: anIndex put: aValue
  "Stores the integer value aValue in the character cell of the receiver
 specified by anIndex. Return aValue."

  self at: anIndex put: (Character withValue: aValue).
  ^ aValue
