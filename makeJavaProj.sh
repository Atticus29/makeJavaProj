#! /bin/bash

# User interface

echo "This script will create all necessary directories and files for a Java project at Epicodus. It will also fill those files with initial code (importing, classes, build.gradle contents, .gitignore contents). It will then open a new tab and navigate to your class files."
echo "-----"
echo "IF YOU MISSPELL ANYTHING, QUIT IMMEDIATELY AND START OVER"
echo "-----"
echo "Now, enter the project name (ex: ping-pong):"
read projectName
echo "I got $projectName"
echo
echo "Now, enter the class name (ex: PingPong):"
echo "UpperCamelCase alphabetic ONLY! Will also make appropriate Test.java"
read className
echo "I got $className"
echo "Are those both correct? Hit [N] to exit or any other key to continue."
read yesOrNo

read -n 1 yesOrNo

if [ "$yesOrNo" = "n" -o "N" ]; then
    echo
    echo "EXITING, TRY AGAIN"
    exit
else
    echo "Running script!"
fi


# The fun stuff
touch -p ~/Desktop/$projectName/src/main/java/App.java
printf "public class App{\n\tpublic static void main(String[] args) {\n\t}\n}"> ~/Desktop/$projectName/src/main/java/App.java
touch ~/Desktop/$projectName/src/main/java/$className.java
printf "import java.util.ArrayList;\nimport java.util.List;\ninport java.util.Arrays;\n\npublic class $className{\n\n}" > ~/Desktop/$projectName/src/main/java/$className.java
touch -p ~/Desktop/$projectName/src/test/java/$classNameTest.java
printf "import org.junit.*;\nimport static org.junit.Assert.*;" > ~/Desktop/$projectName/src/test/java/$classNameTest.java
printf "\n\npublic class $classNameTest {\n\n}" >> ~/Desktop/$projectName/src/test/java/$classNameTest.java
touch ~/Desktop/$projectName/build.gradle
printf "apply plugin: 'java'\napply plugin: 'application'\n\narchivesBaseName ="\""$projectName"\""\nversion = '1.0'\nmainClassName ="\""App"\"" \n\nrepositories {\n\tmavenCentral()\n}\n\ndependencies {\n\ttestCompile group: 'junit', name: 'junit', version: '4.+'\n}" > ~/Desktop/$projectName/build.gradle
touch ~/Desktop/$projectName/README.md
# add boilerplate readme?

# Add gitignore contents
cat > ~/Desktop/$projectName/.gitignore <<EOF

# Compiled source #
############
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
############
*.log

# OS generated files #
############
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Java and Gradle #
############
build/
.gradle/

EOF

cd ~/Desktop/$projectName/
#Open new terminal tab
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$1\"/build/classes/main" in window 1
    end tell
EOF
}
# pass the new tab function the $1 var, as when you make a new function $1 becomes an arg for it as well, so if you just called tab it would print nothing in the $1 inside the function.
tab $projectName

# ooh more fun stuff down here?
