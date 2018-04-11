initialization
initialize
  self initializeTextMorph.
  super initialize.
  hasUnacceptedEdits := false.
  hasEditingConflicts := false.
  askBeforeDiscardingEdits := true.
  self minimumWidth: (TextStyle defaultFont widthOf: $m) * 10.	"scroller addMorph: textMorph."
  self addMorph: textMorph.	"Reset minExtent because only now we can anser #isAutoFit correctly."
  self minimumExtent: 0 @ 0	"
    updateMinimumExtent"