*BPMorphic
userInterfaceTheme
  "Call this to conveniently access properties from the current user interface theme."

  ^ UserInterfaceTheme current
    pushScope: self;
    yourself