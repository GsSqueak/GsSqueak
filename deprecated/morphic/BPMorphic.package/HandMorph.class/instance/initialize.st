initialization
initialize
  super initialize.
  self initForEvents.
  keyboardFocus := nil.
  mouseFocus := nil.
  bounds := 0 @ 0 extent: 60 @ 60.
  userInitials := ''.
  damageRecorder := DamageRecorder new.
  cachedCanvasHasHoles := false.
  temporaryCursor := temporaryCursorOffset := nil.
  self initForEvents