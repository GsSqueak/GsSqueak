I am a canvas that converts Morphic drawing messages into Postscript.  The canvas itself does not actually generate the Postscript code, but rather sends messages corresponding 1:1 to the Postscript imaging model to its target (default: PostscriptEncoder), which has the job of generating actual drawing commands.

PostscriptCharacterScanner and PostscriptDummyWarp are helper classes that simulate effects currently implemented via BitBlt-specific mechanisms during Postscript generation.  They should be going away as Morphic becomes fully device independent.

