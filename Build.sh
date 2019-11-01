#!/bin/bash
ls
cd Launchpad
input="../FioriLaunchpadExtensions/Plugins.txt"
echo "Start Building Fiori Launchpad"
while IFS= read line
do
 printf 'Installing npm package %s\n' "$line"
 pkg=$(echo $line | tr -d '\r')
 npm install $pkg
 printf 'Adding %s to config\n' "$pkg"
 node build/addPlugin.js $pkg
done < "$input"

echo "End Building Fiori Launchpad"