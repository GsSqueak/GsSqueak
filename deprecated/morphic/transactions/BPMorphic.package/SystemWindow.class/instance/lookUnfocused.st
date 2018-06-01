focus
lookUnfocused
  "Optimize performance."

  self isLookingFocused
    ifFalse: [ ^ self ].
  self isLookingFocused: false.
  label
    ifNotNil: [ 
      label
        color:
          (self userInterfaceTheme unfocusedLabelColor ifNil: [ Color darkGray ]) ].
  self dimWindowButtons.
  [ :col | 
  self
    setStripeColorsFrom: col;
    adoptPaneColor: col ]
    value: self paneColorToUseWhenNotActive