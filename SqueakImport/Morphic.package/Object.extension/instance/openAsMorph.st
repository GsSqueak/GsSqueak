*morphic
openAsMorph
	"Open a morph, as best one can, on the receiver"

	^ self asMorph openInHand

"
234 openAsMorph
(ScriptingSystem formAtKey: #TinyMenu) openAsMorph
'fred' openAsMorph
"