private
hackURL: urlString
	(urlString findString: '/SuperSwikiProj/') > 0 
		ifTrue:[^urlString copyReplaceAll: '/SuperSwikiProj/' with: '/uploads/']
		ifFalse:[^urlString]