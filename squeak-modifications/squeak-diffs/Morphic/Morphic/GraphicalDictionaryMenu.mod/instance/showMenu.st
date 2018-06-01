menu commands
showMenu
	"Show the receiver's menu"

	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu title: 'Graphics Library'.
	aMenu addStayUpItem.
	aMenu addList: #(
		('remove'			removeEntry			'Remove this entry from the dictionary')
		('rename'			renameEntry			'Rename this entry')
		('repaint'			repaintEntry			'Edit the actual graphic for this entry' )
		-
		('hand me one'		handMeOne				'Hand me a morph with this picture as its form')
		('encode to Workspace'	encodeToWorkspace		'Open a Workspace with the grapics encoded to be added to code')
		('browse symbol references'
							browseIconReferences	'Browse methods that refer to this icon''s name')
		('browse string references'
							browseStringIconReferences 'Browse methods that refer to string constants that contain this icon''s name')
		('copy name'		copyName				'Copy the name of this graphic to the clipboard')
		-
		('find...'			findEntry				'Find an entry by name')
		('find again'		findAgain				'Find the next match for the keyword previously searched for')).
	aMenu popUpInWorld
