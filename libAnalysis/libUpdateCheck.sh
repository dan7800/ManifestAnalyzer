#!/bin/bash 

### Description: Loop through the oSARA library data set to determine if a library dependency is new, or is merely an update



# db=../data/database-Win.sqlite
db="/Users/imagine/Desktop/RCode/data/database-Win.sqlite"

clear;


#myvar=$(sqlite3 $db "select * from view_processedLibrarysauthors limit 5;")



results="$(sqlite3 $db 'select dcl_id, action, dependencies from view_processedLibrarysauthors limit 5')"

#for rows in "${results[@]}"
#do
#  fieldA=`echo ${rows}| awk '{print $1}'`;
#  fieldB=`echo ${rows}| awk '{print $2}'`;
#  fieldC=`echo ${rows}| awk '{print $3}'`;

#echo ${rows}| awk '{print $3}' 


#  echo ${fieldA} ${fieldB} ${fieldC};
#done



#cnt=${#results[@]}
#for (( i=0 ; i<cnt ; i++ ))
#do
#    echo ${results[$i]}
  #  fieldA=${results[0]};
  #  fieldB=${results[1]};
  #  fieldC=${results[2]};
  #  echo $fieldA
#done
echo ${results[0]}

#while read a b c
#do
#	echo "Dan"
 #   echo "..${a}..${b}..${c}.."
#done < <(echo "select dcl_id, action, dependencies from view_processedLibrarysauthors limit 5" | sqlite3 $db)



#while read a b c
#do
#    echo "..${a}..${b}..${c}.."
#done < <(echo "SELECT A, B, C FROM table_a" | mysql database -u $user -p $password)


#echo "dan"



exit


### Remove all numbers from String
### Eliminate all version info
function cleanString {

	strVal=$1
	strVal=${strVal//./}  # Remove .
	strVal=${strVal//:/}  # Remove :
	strVal=${strVal//@/}  # Remove @
	strVal=${strVal//[0-9]/} # Remove all numbers

	echo $strVal
}



##  Function to determine update type.
##	Only check the String
function updateTypeStringMatch { 

	str_orig=`cleanString $1`
	str_update=`cleanString $2`

	#echo $str_orig
	#echo $str_update

	if [ $str_orig == $str_update ]
		then
		echo "update"  # Same
	else
		echo "new" # Diff
	fi

}



## Loop through all library updates





# For each update

# if added
# 	check list of most recent commits
	#	if simlar, then mark as update
	#	If nothing simlilar, then mark as new
# if removed
	# Look at other dependencies in commit (adds only)
	#	If similar, then update




########


### Work to make this more efficient
function examineRow {
	dcl_id=$1


#	echo $dcl_id

	action=`sqlite3 $db  "SELECT action FROM view_processedLibrarysauthors WHERE dcl_id='$dcl_id';"`
	echo $action

#	if [ $action eq "added" ]
	if [ "$action" == "added" ]
	then
		echo "check added"  # Same
	else




		echo "check removed" # Diff
	fi






#	echo examine
}





### Loop through all items in the db
sqlite3 $db "select dcl_ID from view_processedLibrarysauthors where appID =3 limit 1" | while read dcl_id; do
    # use $theme_name and $guid variables

## Todo: Pass in the needed variables


examineRow $dcl_id
#    echo "theme: $name, guid: $action"
#    echo "________________"
done






## Loop through all of the updates to determine the name of the dependency and app to see if the new dependcy is like the old one


## Adds - See if a removed dependency had a similar name



## Remove: Does the next commit have a similar dependency


#echo $db

#test=`sqlite3 db  "SELECT count(*) FROM from dcl_1;"`
#test=`sqlite3 database  "SELECT count(*) FROM table;"`
#test=`sqlite3 $db  "SELECT count(*) FROM dcl_1;"`

#echo $test





######### Tests ##########

### Removing all numbers

#newVal=`removeAllNumbers DaAAAAAn123`
#echo DanAAA $newVal




#cleanString "net.i2p.android:client:0.7"


## Test the String matching function


#updateTypeStringMatch "com.anthonycr.grant:permissions:1.0" "com.anthonycr.grant:permissions:1.1.2"
#updateTypeStringMatch "com.google.dagger:dagger:2.0.1" "com.google.dagger:dagger:2.0.1"
#updateTypeStringMatch "net.i2p.android:client:0.6@aar" "net.i2p.android:client:0.7" ## will cause problems

#updateTypeStringMatch "org.jsoup:jsoup:1.9.1" "org.jsoup:jsoup:1.9.2"
#updateTypeStringMatch "com.squareup:otto:1.3.8" "libs/jsoup-1.8.1.jar"


## Remove all numbers


## Not Similar
#updateTypeStringMatch dan smit


## Similar


# ":libnetcipher" - Same
#"com.android.support:appcompat-v7:23.0.1" "com.android.support:appcompat-v7:23.1.0"


#echo "Script Complete"
