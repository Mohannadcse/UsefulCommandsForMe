GitHub (http://rogerdudler.github.io/git-guide/)

```sh
1- curl -u '<userName>' https://api.github.com/user/repos -d '{"name":"<projectname>","description":"<This project is a test>"}'  >> create repo

2- git init >> initalize the repo

3- git add <filName or . to add all files>  >> stage files in the local repository 

4- git commit -m "<YourComment>"  >> add your commit

5- git remote add origin https://github.com/<userName>/<porjectName>.git >> identify the name of the github repo

6- git remote -v >> verify the URL of the repo

7- git push origin master >> push the commited modifications to the remote repo
```

Steps 1-2, required only once when the local repo is created. Steps 3-7, required to every time you want to push the modifications. 
	

Remove entry from $PATH
```sh 
export PATH=${PATH/':/entry/path'/} 
```

Add entry to $PATH
```sh

	1- export $MAVEN_HOME=/opt/mave/
	
	2- export PATH=$MAVEN_HOME/bin:${PATH}
```

Store a path permenantly:


	1- gedit ~./bashrc
	2- export PATH="~/anaconda/bin:$PATH"
	


Run Java from command:

	java -classpath D:\myprogram;D:\myprogram\lib\supportLib.jar org.mypackage.HelloWorld
	where org.mypackage.HelloWorld:: Java class
	D:\myprogram\lib\supportLib.jar:: required JAR

	
Read text file using bash:

	t=`cat keywords.txt`


generate SSH keys

	ssh-keygen
	new pairs will be created under the director /home/directory/.ssh/id_rsa (public key ends with .pub)

connect via SSH

	ssh <userName>@<Server>

copy from local to remot via ssh

	scp /Users/username/Desktop/11.jpeg username@domain:/home/xxx/xxx
	scp -r dex mohannad@tusker.unl.edu:/work/thinklab/mohannad/

Change the ID of VDI or VHD

	c:\Program Files\Oracle\VirtualBox>VBoxManage.exe internalcommands sethduuid "G:\CheckVMs\Ubuntu_16.vhd"

access Windows-host shared folders from Ubuntu-guest

	# sudo mkdir /media/windows-share
	#sudo mount -t vboxsf <folder-name> /media/windows-share

Print filenames content of a directory without path

	for f in MyDirectory/*;do echo "${f##*/}";done
	
Resize HD VirtualBox

	c:\Program Files\Oracle\VirtualBox>VBoxManage.exe modifymedium "G:\VMs\Win7\Win7
	.vhd" --resize 40000
	https://www.youtube.com/watch?v=7Aqx-VHv2_k


retrieve line number of a specific entry in CSV file

	grep -n <pattern> <fileName>.csv | cut -f 1 -d ':'

Show the content of a file based on certain line number 

	sed -n <num>p file
	sed -n <num1,num2>p file  ==== for range from line num1 to line num2

Obtain specific values from a webpage

	curl  https://developers.google.com/android/drivers | sed -n 's|.*>\(.*\) binaries for Android 8.*|\1|p' | sort | uniq

Copy specific lines from text file
	sed -n <startLineNo>,<endLineNo>p <fileName>

Run Jitana on HCC

	module load compiler/gcc/7.1 boost/1.66
	git clone https://github.com/ytsutano/jitana.git
	mkdir build
	cd build
	cmake -DBoost_INCLUDE_DIR=$BOOST_DIR/include -DBoost_LIBRARY_DIR=$BOOST_DIR/lib DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-L$BOOST_DIR/lib" ../jitana/ 
	make -j4

Get Android framework DEX files:

	adb pull system/framework<boot.oat>
	java -jar oat2dex.jar boot  boot.oat (two directories will be created DEX and ODEX)

Committing to git:

	git add <fileName/FolderName>
	git commit -m "<your comment>"
	git push -u origin master


Install JDK 7 manually

	https://stackoverflow.com/questions/16263556/installing-java-7-on-ubuntusubl
	https://askubuntu.com/questions/67909/how-do-i-install-oracle-jdk-6

	https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
	sudo update-alternatives --config java
	sudo nano /etc/environment	
	JAVA_HOME="/usr/lib/jvm/java-8-oracle"
	source /etc/environment
	echo $JAVA_HOME


Updating Java version

	sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-6-oracle/bin/java" 1
	sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-6-oracle/bin/javac" 1
	sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/java-6-oracle/bin/javaws" 1


Unzip/Uncompress

	tar -xvzf <tgz file>

Create git branch

	git branch <branch_Name>   --\___ both commands can be combined to be git checkout -b <branch_Name>
	git checkout <branch_Name> --/
	git checkout -b <sub_branch> <main_branch>  >> create a branch <sub_branch> in another existing branch <main_branch>
	make the intended changes 
	git add all OR in case of .diff file has been applied (git add -u :/), git add . (add all files including untracked files)
	git commit -m "<your comments>"

Merge git branch

	git checkout master
	git merge <branch_Name>  (we should be at master before doing the merge)

git commands

	git log
	git add <file name>
	git status
	git branch -m <new-name> >>>>> rename a branch
	git log --all --decorate --oneline --graph
	git diff master <branch_name>  >>> shows the difference between master and the new branch
	git branch --merged  >>> verify which branches have been merged
	git branch -d <branch_name> >>> delete a branch 

Kill process 

	ps aux | grep <process name>

Remove file extension:

	${FILE%.*}

Applying diff patch:

	patch  --dry-run -p 1 -d ./ < ../../../modification/reana.diff

List files sorted based on file size and show the size in K

	ls -l -S --block-size=K <folder_name >

Screen Command

	screen -S <ScreenName>
	ctrl+a d  >>> drop out the current screen
	screen -ls >>> show all screen sessions
	screen -r <ScreenName> >>> reattach/reconnect to a specific screen session
	screen -X -S <ScreenName> quite  >>> delete a Sc 

Install Z3

	Find the location of site-packages 
	Run this command python scripts/mk_make.py --prefix=/usr/local/ --python --pypkgdir=/Library/Python/2.7/site-packages (on Ubuntu should be --prefix=/home/<userName>)

Run JD-GUI

	java -jar jd-gui-1.4.0.jar

Dexdump command:

	dexdump -d <path-to-dex>

Find file in a directory:

	find <directory-location> -name <fileName>

Convert ODEX to DEX

	adb pull system/framework/services.odex
	java -jar baksmali-2.2.0.jar d services.odex -o out
	java -jar smali-2.2.0.jar ass out -o services.dex


Remove the path from the terminal 

	export PS1='> ' 

Import Java workspace into eclipse:

	1- File > Import
	2- Select from existing workspace
	3- Select the location
	4- Check the box copy projects into workspace 

Remove directories from remote git:

	git rm -r --cached <directoryName>
	git commit -m "note"
	git push origin master

Modify the 1st occurrence in text file
	
	for f in $t; do awk '!x{x=sub("WORD","REPLACE")}7' $f > t1.txt; rm $f; cat t1.txt > $f; rm t1.txt; done


