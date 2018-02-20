*BPToolsSqueak
topazClassDefinition
^ 'run
Smalltalk at: #', self name, ' ifAbsent: 
[', self gsDefinition ,']
%'