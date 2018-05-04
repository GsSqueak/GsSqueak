import glob

for filename in glob.glob('*/*.st'):
  print(filename)
  file = open(filename, 'r')
  content = file.readlines()
  newContent = content[0] + content[1] + '^ self _env0 ' + content[1]
  file.close()  
  wFile = open(filename, 'w')
  wFile.write(newContent)
  
  
