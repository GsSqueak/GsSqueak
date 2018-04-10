as yet unclassified
commit
  "  | ownerCache |
  self posToState.
  ownerCache := owner.
  owner := nil."

  System commit.
  Transcript show: self color.
  self redraw	" owner := ownerCache.
  self posFromState"