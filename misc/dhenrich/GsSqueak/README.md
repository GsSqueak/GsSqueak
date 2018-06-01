# GsSqueak Proof of Concept

1. [Installation](#installation)
2. [Proof of Concepts](#proof-of-concepts)
3. [Resources](#resources)

## Installation

### Install GsDevKit_home

```
git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
. bin/defHOME_PATH.env
installServerClient
```

### Download GemStone/S 3.4.0 Alpha5

Until GemStone/S 3.4.0 is officially released, you must download an Alpha version of GemStone 3.4.0.
The following instructions are for manually installing GemStone/S 3.4.0 Alpha5:

```
cd $GS_HOME/shared/downloads/zip
curl "ftp://ftp.gemtalksystems.com/pub/GemStone64/3.4.0-Alpha5/GemStone64Bit3.4.0-x86_64.Linux.zip" -o GemStone64Bit3.4.0_Alpha5-x86_64.Linux.zip
unzip GemStone64Bit3.4.0_Alpha5-x86_64.Linux.zip
mv GemStone64Bit3.4.0-x86_64.Linux ../products
```

### Clone GsSqueak 

```
cd $GS_HOME/shared/repos
git clone https://github.com/dalehenrich/GsSqueak.git
```

### Create a GsSqueak stone
This stone is a standard GemStone repository without tODE installed. This stone should be used for the GsSqueak experiments.


```
createStone -g -s $GS_HOME/shared/downloads/products/GemStone64Bit3.4.0-x86_64.Linux/bin/extent0.dbf gsSqueak_340 3.4.0
```

### Create a tODE stone and tODE client
Create a tODE stone and client, so that you can easily browse the GemStone class library. Note that methods in categories beginning with a `*` are extension methods for the tODE environment and are not present in the `gsSqueak_340` stone.

```
createStone tode_340 3.4.0
createClient tode
```

## Proof of Concepts

### Proof of Concept 1

The goal of the initial proof of concept is to provide an introduction to GemStone method environments.
The topaz script for this proof of concept can be found at `$GS_HOME/shared/repos/GsSqueak/scripts/pos_1.tpz`.

For GsSqueak, we will be using method environment 7.

1. Create a GsSqueak GemStone user: 
```Smalltalk
| gsSqueak |
gsSqueak := AllUsers userWithId: 'GsSqueak' ifAbsent: [ nil ].
gsSqueak ~~ nil
  ifTrue: [
    AllUsers removeAndCleanup: gsSqueak.
    System commitTransaction.
 ].
(AllUsers
  addNewUserWithId: 'GsSqueak'
  password: 'swordfish')
    addPrivilege: #'CodeModification';
    addPrivilege: #'UserPassword';
    addPrivilege: #'OtherPassword';
    yourself.
System commit.
```
2. Adjust the [symbol list][6] for GsSqueak to contain a *SymbolDictionary* named **Smalltalk** and a  *SymbolDictionary* named **GemStone**. **GemStone** contains a few classes from the standard GemStone class hierarchy to enable debugging of the environment (**System**) and execution control for the topaz scripts (**GemStoneError**).
```Smalltalk
| symbolList userProfile |
userProfile := System myUserProfile.
symbolList := SymbolList new.
symbolList 
	createDictionaryNamed: #'GemStone' at: 0;
	createDictionaryNamed: #'Smalltalk' at: 0;
	yourself.
(symbolList objectNamed: #GemStone) 
  at: #System put: (Globals at: #System);
  at: #GemStoneError put: (Globals at: #GemStoneError);
  yourself.
userProfile symbolList: symbolList.
System commit.
```
2. Populate **Smalltalk** with a minimal class hierarchy consisting of *ProtoObject*, *Object*, and *SmallInteger*. *ProtoObject* and *Object* will be new classes that are created in the **Smalltalk** symbol dictionary.
```Smalltalk
(nil subclass: 'ProtoObject'
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: {}
	inDictionary: Smalltalk
	newVersionOf: (Smalltalk at: #ProtoObject ifAbsent: [nil])
	description: '0'
	options: #()
	) category: 'GemStone'.
(ProtoObject subclass: 'Object'
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: {}
	inDictionary: Smalltalk
	newVersionOf: (Smalltalk at: #Object ifAbsent: [nil])
	description: '0'
	options: #()
	) category: 'GemStone'.
```
   *SmallInteger* will be the standard GemStone class, but it's method environment 7 superclass method look up chain will be routed through *Object*.
```Smalltalk
| gsSqueak gsSqueakObjectClass|
gsSqueak := AllUsers userWithId: 'GsSqueak'.
gsSqueakObjectClass := gsSqueak symbolList objectNamed: #Object.
SmallInteger superclassForEnv: 7 put: gsSqueakObjectClass.
System commit.
```
3. Implement *ProtoObject>>doesNotUnderstand:* in method enviroment 7 so that messages not understood in method environment 7 will be forwarded to method environment 0. 
```
     set compile_env: 7

     category: 'gemstone prim env 7'
     method: Object
     doesNotUnderstand: aMessageDescriptor
       "invoke MessageNotUnderstood indirectly in env 0"

     ^ self @env0: doesNotUnderstand: aMessageDescriptor
     %
```
4. Implement *SmallInteger>>foo:* in method environment 7 to forward to *SmallInteger>>+* in method environment 0.
```
     set compile_env: 7

     category: 'env 7 experiment'
     method: SmallInteger
     foo: arg

       ^ self @env0: + arg
     %
```

#### Proof of Concept 1 Excercise

1. Start a topaz session:
```
   startTopaz gsSqueak_340 -l
```
2. login in as GsSqueak and set `compile_env` for topaz to 0:
```
set u GsSqueak password swordfish
login
set compile_env: 0
```
3. In method environment 0, the standard GemStone **SmallInteger** methods are available:
```
run
3 / 4
%
```
4. In method environment 0, the method that was added for method environment 7 is not available:
```
expecterror GemStoneError 2010
run
3 foo: 4
%
```
5. Switch to environment 7 in topaz and run the same set of doits:
```
set compile_env: 7

expecterror GemStoneError 2010
run
3 / 4
%

run
3 foo: 4
%
```

## Resources

1. My original [PharoGs experiments][3].
2. James Foster's ESUG 2017 presentation [Running Pharo on the GemStone VM][2] and companion [PharoGs scripts and file ins][1].
3. GemStone/S 64 Programming Guide ([pdf][4]/[html][5]).
4. GemStone/S 64 Topaz User's Guide ([pdf][8]/[html][7]).

[1]: https://github.com/jgfoster/PharoGs/tree/james
[2]: https://www.slideshare.net/esug/running-pharo-on-the-gemstone-vm
[3]: https://github.com/dalehenrich/PharoGs
[4]: https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-ProgGuide-3.3.pdf
[5]: https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-ProgGuide-3.3/GS64-ProgGuide-3.3.htm

[6]: https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-ProgGuide-3.3/3-Symbols.htm
[7]: https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-Topaz-3.3/GS64-Topaz-3.3.htm
[8]: https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-Topaz-3.3.pdf
