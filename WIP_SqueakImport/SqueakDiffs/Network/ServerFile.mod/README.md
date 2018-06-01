Represents the non-data part of a file on a server on the internet.  I am owned by a RemoteFileStream, who has the data.

Since FileStream is a Stream and I am not, use this to always get a stream:
	xxx isStream ifFalse: [^ xxx asStream].

