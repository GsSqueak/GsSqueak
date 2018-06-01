accessing-selection
selectionInterval
  "Answer the interval that is currently selected."

  ^ SqueakInterval from: self startIndex to: self stopIndex - 1