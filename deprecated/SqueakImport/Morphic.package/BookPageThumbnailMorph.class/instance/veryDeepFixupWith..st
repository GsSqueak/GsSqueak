copying
veryDeepFixupWith: deepCopier
	"If target and arguments fields were weakly copied, fix them here.  If they were in the tree being copied, fix them up, otherwise point to the originals!!"

super veryDeepFixupWith: deepCopier.
page := deepCopier references at: page ifAbsent: [page].
bookMorph := deepCopier references at: bookMorph ifAbsent: [bookMorph].
