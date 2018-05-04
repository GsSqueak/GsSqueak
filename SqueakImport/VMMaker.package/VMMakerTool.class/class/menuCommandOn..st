world menu
menuCommandOn: aBuilder 
	<worldMenu> 
	(aBuilder item: #'VMMaker')
		parent: #Tools;
		action:[self openInWorld]