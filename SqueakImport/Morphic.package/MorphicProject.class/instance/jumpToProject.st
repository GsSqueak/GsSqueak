utilities
jumpToProject
	"Present a list of potential projects and enter the one selected."

	"Project current jumpToProject"

	| menu |
menu:=MenuMorph new.
menu defaultTarget: self.
	menu := self buildJumpToMenu: menu.
	menu popUpInWorld