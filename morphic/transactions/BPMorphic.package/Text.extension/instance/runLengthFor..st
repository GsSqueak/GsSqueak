*BPMorphic
runLengthFor: characterIndex
  "Answer the count of characters remaining in run beginning with 
	characterIndex."

  self size = 0
    ifTrue: [ ^ 0 ].	"null tolerates access"
  ^ runs runLengthAt: characterIndex