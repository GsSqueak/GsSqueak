class list
invalidateClassList

	classList := self currentClassList.
	self reselectClass.
	self changed: #classList.