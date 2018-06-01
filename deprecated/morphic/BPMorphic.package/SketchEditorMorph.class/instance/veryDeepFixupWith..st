copying
veryDeepFixupWith: deepCopier 
	"If target and arguments fields were weakly copied, fix them here. If
	they were in the tree being copied, fix them up, otherwise point to
	the originals!!"
	super veryDeepFixupWith: deepCopier.
	hostView := deepCopier references
				at: hostView
				ifAbsent: [hostView].
	enclosingPasteUpMorph := deepCopier references
				at: enclosingPasteUpMorph
				ifAbsent: [enclosingPasteUpMorph]