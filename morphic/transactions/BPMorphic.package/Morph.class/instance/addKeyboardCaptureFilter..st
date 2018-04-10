events-filtering-capturing
addKeyboardCaptureFilter: anObject
  self
    keyboardCaptureFilters:
      (self addFilter: anObject to: self keyboardCaptureFilters)