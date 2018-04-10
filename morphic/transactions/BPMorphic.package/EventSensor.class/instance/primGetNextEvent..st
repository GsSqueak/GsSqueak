private-I/O
primGetNextEvent: anArray
  GraFFIcsLibrary inst
    getEvents: (SessionTemps current at: #'Display') bpWindow
    into: anArray