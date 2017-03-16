#!/bin/bash

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
read -n 1 yesOrNo

if [ "$yesOrNo" == "n" -o "$yesOrNo" == "N" ]; then
    echo
    echo "EXITING, TRY AGAIN"
    exit
else
    echo "Running script!"
fi


# The fun stuff
mkdir -p ~/Desktop/$projectName/src/main/java
touch ~/Desktop/$projectName/src/main/java/App.java
printf "public class App{\n\tpublic static void main(String[] args) {\n\t}\n}"> ~/Desktop/$projectName/src/main/java/App.java
touch ~/Desktop/$projectName/src/main/java/$className.java
printf "import java.util.ArrayList;\nimport java.util.List;\ninport java.util.Arrays;\n\npublic class $className{\n\n}" > ~/Desktop/$projectName/src/main/java/$className.java
mkdir -p ~/Desktop/$projectName/src/test/java
touch ~/Desktop/$projectName/src/test/java/"$className"Test.java
printf "import org.junit.*;\nimport static org.junit.Assert.*;\n\npublic class $classNameTest {\n\n}" > ~/Desktop/$projectName/src/test/java/"$className"Test.java
# printf "\n\npublic class $classNameTest {\n\n}" >> ~/Desktop/$projectName/src/test/java/$classNameTest.java
touch ~/Desktop/$projectName/build.gradle
printf "apply plugin: 'java'\napply plugin: 'application'\n\narchivesBaseName ="\""$projectName"\""\nversion = '1.0'\nmainClassName ="\""App"\"" \n\nrepositories {\n\tmavenCentral()\n}\n\ndependencies {\n\ttestCompile group: 'junit', name: 'junit', version: '4.+'\n}" > ~/Desktop/$projectName/build.gradle
touch ~/Desktop/$projectName/README.md
# add boilerplate readme?

touch ~/Desktop/$projectName/.gitignore

# Add gitignore contents
printf "# Compiled source #\n############\n*.com\n*.class\n*.dll\n*.exe\n*.o\n*.so\n\n# Packages #\n############\n*.7z\n*.dmg\n*.gz\n*.iso\n*.jar\n*.rar\n*.tar\n*.zip\n\n# Logs and databases #\n############\n*.log\n\n# OS generated files #\n############\n.DS_Store\n.DS_Store?\n._*\n.Spotlight-V100\n.Trashes\nehthumbs.db\nThumbs.db\n\n# Java and Gradle #\n############\nbuild/\n.gradle/" > ~/Desktop/$projectName/.gitignore

cd ~/Desktop/$projectName
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
