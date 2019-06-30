import os
import sys
filename = sys.argv[1]
time = sys.argv[2] # .01s, 1s
inputfile = sys.argv[3]
#a  = filename.split('.')
os.chdir('/home/amar/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TechFestFinal/uploadFolder/')#change it.
b  = filename.split('/')
c = b[-1]
d = c.split('.')
print '/home/amar/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TechFestFinal/uploadFolder/' +  d[0]+"_output.txt"
if d[-1]=='c':
	if(os.path.isfile(d[0])):
		os.remove(d[0])
	try:
		os.system("gcc "+ filename + " -o "+ d[0])
	except:
		print("Compilation Failed!!")
	try:
		cmd = "timeout " + time +" ./" + d[0] + " < "+ inputfile +" > "+ d[0]+"_output.txt"
		print cmd
		os.system(cmd)
	except:
		print("Failed to Run!!")
elif d[-1] == 'cpp':
	if(os.path.isfile(d[0])):
		os.remove(d[0])
	try:
		os.system("g++ "+ filename + " -o "+ d[0])
	except:
		print("Compilation Failed!!")
	try:
		os.system("timeout " + time +" ./" + d[0] + " < " + inputfile + " > "+ d[0]+"_output.txt")
	except:
		print("Failed to Run!!")
elif d[-1] == 'java':
	if(os.path.isfile(d[0]+'.class')):
		os.remove(d[0]+'.class')
	try:
		os.system("javac "+ filename)
	except:
		print("Compilation Failed!!")
	try:
		e = d[0].split('_')
		#d[0] = e[0]
		cmd = "timeout " + time +" java " + e[0] + " < " + inputfile + " > "+ d[0]+"_output.txt"
		print cmd
		os.system(cmd)
	except:
		print("Failed to Run!!")
elif d[-1]=='py':
	if(os.path.isfile(d[0]+'.pyc')):
		os.remove(d[0]+'.pyc')
	try:
		cmd = "timeout " + time +" python " + filename + " < " + inputfile + " > "+ d[0]+"_output.txt"
		print cmd
		os.system(cmd)
	except:
		print("Run Time Error")

