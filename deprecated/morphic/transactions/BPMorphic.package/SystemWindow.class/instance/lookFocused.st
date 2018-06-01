focus
lookFocused
  "Optimize performance."

  self isLookingFocused
    ifTrue: [ ^ self ].
  self isLookingFocused: true.
  label
    ifNotNil: [ label color: (self userInterfaceTheme focusedLabelColor ifNil: [ Color black ]) ].
  (self isKeyWindow or: [ self class windowTitleActiveOnFirstClick ])
    ifTrue: [ self undimWindowButtons ].
  [ :col | 
  self
    setStripeColorsFrom: col;
    adoptPaneColor: col ]
    value: self paneColorToUse