drawing
updateNamePosition

	| nameMorph shadowMorph nameFillerMorph |

	(nameMorph := self findA: UpdatingStringMorph) ifNotNil: [
		nameMorph position:
			(self left + (self width - nameMorph width // 2)) @
			(self bottom - nameMorph height - 2).
	].
	(nameFillerMorph := self findA: AlignmentMorph) ifNotNil: [
		nameFillerMorph
			position: self bottomLeft - (0@20);
			extent: self width@20.
	].
	(shadowMorph := self findA: ImageMorph) ifNotNil: [
		shadowMorph delete	"no longer used"
	].

