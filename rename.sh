GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
FILE_COUNT=0


printf "${NC}Enter the string to search for: ${PURPLE}"
read search_for

SEARCH_QUERY="find . -name '*${search_for}*'"
for filename in `eval $SEARCH_QUERY`;  do
	FILE_COUNT=$[$FILE_COUNT +1]
done
printf "${PURPLE}${FILE_COUNT}${NC} files that match your query ${GREEN}\n"

printf "${NC}Enter the string to replace: ${GREEN}"
read to_replace
printf "${NC}Enter the string to replace with: ${BLUE}"
read replace_with
printf "${NC}Looking for ${PURPLE}$search_for ${NC} and replacing ${GREEN}$to_replace ${NC}with ${BLUE}$replace_with${NC}\n"




for filename in `eval $SEARCH_QUERY`; 



do
	new_filename="${filename//$to_replace/$replace_with}"
	
	REPLACE_COMMAND="mv '${filename}' '${new_filename}'"; 
	printf "${NC}Old file: ${GREEN} ${filename}\n";
#	printf "${NC}Attempting to replace ${GREEN} ${to_replace} ${NC} with ${BLUE} ${replace_with}\n";
	printf "${NC}New file: ${BLUE} ${new_filename}"
	printf "${NC}\n ------------------------------------------------------------ \n";
	`eval $REPLACE_COMMAND`;

done


