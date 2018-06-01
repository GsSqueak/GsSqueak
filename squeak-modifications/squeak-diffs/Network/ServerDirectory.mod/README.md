Holds all the information needed to read or write on a directory of an internet server.  I am used for FTP and HTTP (and STMP?  NNTP?).  The password policy is: unless it is a public password (like annomyous), clear all passwords before any snapshot.  There is a way to store passwords on the disk.

server 		'www.disney.com'  or '123.34.56.08' or the ServerDirectory above me 
			(if I am a subdirectory sharing the info in a master directory)
directory 	'ftp/pubs/'  name of my directory within the server or superdirectory.
			(for file://, directory is converted to local delimiters.)
type 		#ftp	what you can do in this directory
user 		'Jones45'
password 	an instance of Password.  
group 		an Association ('group name' -> an array of ServerDirectorys)
			If this first one is down, try the next one.  Store on all of them.  I am in the list.
moniker 	'Main Squeak Directory'  Description of this directory.
altURL		When a FTP server holds some web pages, the altURL of those pages is often
			different from the FTP directory.  Put the altURL here.  If the directory is 
			'public_html/Squeak/', the altURL might be 'www.webPage.com/~kaehler2/
			Squeak/'.
urlObject	An instance of a subclass of Url.  It is very good at parsing complex urls.
			Relative references.  file:// uses this.  Use this in the future instead of 
			server and directory inst vars.
socket		nil or an FTPSocket.  Only non-nil if the connection is being kept open
			for multiple stores or retrievals.  
loaderUrl	a partial url that is ised to invoke squeak in a browser and load a project.

A normal call on some command like (aServer getFileNamed: 'foo') does not set 'socket'.  Socket being nil tells it to close the connection and destroy the socket after this one transcation.  If the caller stores into 'socket', then the same command does NOT close the 
connection.  
	Call 'openKeepFTP' or 'openGroup' to store into socket and keep the connection open.  It is up to the user to call 'quit' or 'closeGroup' later.

DD openKeepFTP.
Transcript cr; show: ((DD getFileNamed: '1198misc-tkKG.cs') next: 100).
Transcript cr; show: ((DD getFileNamed: '1192multFinder-tkKF.cs') next: 100).
DD quit.