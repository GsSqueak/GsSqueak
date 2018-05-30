initialize
installPasteUpAsWorld: pasteUpMorph
	"(ProjectViewMorph newMorphicProjectOn: aPasteUpMorph) openInWorld."

	world := pasteUpMorph beWorldForProject: self.
	self setWorldBackground: true.