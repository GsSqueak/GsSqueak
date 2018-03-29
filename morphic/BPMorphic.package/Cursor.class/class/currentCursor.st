current cursor
currentCursor
  "Answer the instance of Cursor that is the one currently displayed."

  ^ (SessionTemps current at: #'CVStorage') for: self class at: #'CurrentCursor'