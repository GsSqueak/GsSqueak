initialize
for: aUrl in: aLoader
	url := aUrl.
	loader := aLoader.
	semaphore := Semaphore new.