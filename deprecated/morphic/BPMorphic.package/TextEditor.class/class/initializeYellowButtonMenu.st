keyboard shortcut tables
initializeYellowButtonMenu
	"Initialize the yellow button pop-up menu and corresponding
	messages. "
	"TextEditor initialize"
	yellowButtonMenu := MenuMorph fromArray: {{'find...(f)' translated. #find}. {'find again (g)' translated. #findAgain}. {'find and replace ...' translated. #findReplace}. {'do/replace again (j)' translated. #again}. #-. {'undo (z)' translated. #undo}. {'redo (Z)' translated. #redo}. #-. {'copy (c)' translated. #copySelection}. {'cut (x)' translated. #cut}. {'paste (v)' translated. #paste}. {'paste...' translated. #pasteRecent}. #-. {'set font... (k)' translated. #offerFontMenu}. {'set style... (K)' translated. #changeStyle}. {'set alignment...' translated. #chooseAlignment}}
	"
	#-.
	{'more...' translated.				#shiftedTextPaneMenuRequest}.
	"