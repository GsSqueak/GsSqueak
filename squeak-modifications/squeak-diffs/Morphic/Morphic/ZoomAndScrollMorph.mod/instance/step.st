stepping and presenter
step

	| innerPasteUp overlap |

	innerPasteUp := self myTransformMorph firstSubmorph.
	overlap := (innerPasteUp submorphs 
		inject: 0@0 
		into: [ :min :each | min min: each position]) rounded.
	overlap = (0@0) ifFalse: [
		innerPasteUp submorphs do: [ :each | each position: each position - overlap].
		innerPasteUp layoutChanged.
	].



