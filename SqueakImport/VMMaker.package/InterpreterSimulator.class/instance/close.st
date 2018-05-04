initialization
close  "close any files that ST may have opened"
	filesOpen do: [:f | f close]