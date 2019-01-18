#!/bin/bash
#
# ==============================================================
#          Please, Don't Remove Author Details 
# ==============================================================
#
# Author : Suraj Singh Bisht
#          Surajsinghbisht054@gmail.com
#          www.bitforestinfo.com
#          github.com/surajsinghbisht054
#
#
#
# Description:
#            This Script Can Extract All Available Repositories Links With Details From
#            Anyone Github Account.
#
#
#



# instruction to use script

# usages details
if [ $# = 1 ]; then
	if [ $1 = "--help" ] || [ $1 = "-h" ]; then
		printf "====================================================================\n";
		printf "\--------------------- This is Help Menu ---------------------------/\n";
		printf "====================================================================\n";
		printf "                                      Author: Suraj Singh \n";
		printf "                                      surajsinghbisht054@gmail.com\n\n";
		printf "\---------------------- Read Me -----------------------------------/\n";
		printf "       This program can extract Github repositries links of Any \n";
		printf "  Specific Account. If you want to find all repo links of anyone Github,\n";
       		printf "  Just Run This parse over that Account. This script can extract links\n";
      	 	printf "  and Can Save All Links into txt files.\n\n";
		printf "Simple Usages:\n";
		printf "\n\tProgram Usages : %s [url] [repo_type] [output]\n\n" $0;
		printf "Url : https://github.com/example_user_name/\n";
		printf "Repo : fork, source\n";
		printf "output : file_name_to_save Output\n";
		printf "\n\nExample\n"
		printf "  %s github_user_name source links.txt\n\n\n" $0;
		exit;
	fi
else
	if [ $# != 3 ]; then
     		printf "  %s --help\n" $0;
       		printf "\nProgram Usages : %s [url] [repo_type] [output]\n\n" $0;
		exit;

	fi;
fi;


# initialize user inputs
USERNAME=$1;
REPO_TAB=$2;
OUTPUT_F=$3;

# Time To Download First Page of Account
w="https://github.com/$USERNAME?tab=repositories&type=$REPO_TAB";

printf "\n\nGenerating Github link : %s\n" $w

wget $w -O /tmp/github_link_extractor

for((n=0; n<1; n++))
do

	cat /tmp/github_link_extractor | tr ' ' '\n' | tr '>' '\n' | grep -i "href=[^>]" | cut -d '"' -f 2 | uniq | sort | grep -e "/$USERNAME/.*" | xargs -n 1 -I% echo "https://github.com%" > $OUTPUT_F ;

	token=$(cat /tmp/github_link_extractor | tr " " "\n" |grep -e "href="| tr ">" "\n" | grep -e "after" | cut -d"=" -f3 | cut -d"&" -f 1);
done;


for((n=0; n<1; n++))
do
	if [ ${#token} -le 90 ];
	then
		w="https://github.com/$USERNAME?after=$token&tab=repositories&type=$REPO_TAB";
		printf "\n\nGenerating Github link : %s\n" $w
		wget $w -O /tmp/github_link_extractor
		cat /tmp/github_link_extractor | tr ' ' '\n' | tr '>' '\n' | grep -i "href=[^>]" | cut -d '"' -f 2 | uniq | sort | grep -e "/$USERNAME/.*" | xargs -n 1 -I% echo "https://github.com%" >> $OUTPUT_F ;

        	token=$(cat /tmp/github_link_extractor | tr " " "\n" |grep -e "href="| tr ">" "\n" | grep -e "after" | cut -d"=" -f3 | cut -d"&" -f 1);

		echo $token;
		echo $((n--));
	fi;

done




