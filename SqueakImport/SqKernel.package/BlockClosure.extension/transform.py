import glob

for filename in glob.iglob('./instance/*.st'):
  f=open(filename, 'r')
  data=f.read()
  f=open(filename, 'w')
  print('*SqKernel-' + data.split('-', 1)[-1], file=f)

