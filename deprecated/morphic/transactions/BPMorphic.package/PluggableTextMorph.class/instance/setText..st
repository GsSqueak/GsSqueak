model access
setText: aText
  textMorph newContents: aText.
  self hasUnacceptedEdits: false.	"self setScrollDeltas."
  self changed