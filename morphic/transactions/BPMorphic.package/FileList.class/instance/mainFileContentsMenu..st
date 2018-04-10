file list menu
mainFileContentsMenu: aMenu 
	"Construct aMenu to have items appropriate for the file browser's code
	pane, for the unshifted state"
	<fileContentsMenuShifted: false>
	^ aMenu addTranslatedList: #(#('find... (f)' #find ) #('find again (g)' #findAgain ) #('find and replace... ' #findReplace ) #('do/replace again (j)' #again ) #- #('undo (z)' #undo ) #('redo (Z)' #redo ) #- #('copy (c)' #copySelection ) #('cut (x)' #cut ) #('paste (v)' #paste ) #('paste...' #pasteRecent ) #- #('do it (d)' #doIt ) #('print it (p)' #printIt ) #('inspect it (i)' #inspectIt ) #('fileIn selection (G)' #fileItIn ) #- #('accept (s)' #accept ) #('cancel (l)' #cancel ) #- #('more...' #shiftedYellowButtonActivity ) );
		 yourself