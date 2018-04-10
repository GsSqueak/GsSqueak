layout
assureLabelAreaVisible
  "Label should be visible to interact with."

  [ :rect | 
  self innerBounds top < rect top
    ifTrue: [ self top: rect top ] ]
    value: (RealEstateAgent maximumUsableAreaInWorld: self world)