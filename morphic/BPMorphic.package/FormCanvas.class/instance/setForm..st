private
setForm: aForm 
	form := aForm.
	port := self portClass toForm: form.
	self reset