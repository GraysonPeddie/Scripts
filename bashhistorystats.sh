#
# The omission of "#!/bin/bash" does not create a BASH subshell for
# this script. If "#!/bin/bash" or "#!/bin/sh" is used, then the
# history won't be shown.
#
# A subshell launches a new BASH process. Executing history within
# a subshell (when adding #!/bin/bash to the top of the script)
# will not show the list of commands executed by the user.
#
# Do a chmod +x ./bashhistorystats.sh before running the script.
#

# Internal Field Separator: split by line instead of word.
IFS=$'\n'

# Create a new array for the list of commands.
commands=()

# Read an output per line into a variable called "line."
# This while loop fills every line into a "commands" array.
while read line
do
    # Determine if "sudo" is used by getting the first command
    # from a "line" variable. "$1' is the first command gathered
    # using "awk."
    if [[ $(echo "$line" | awk '{print $1}') == "sudo" ]]
    then
        commands+=("$(echo "$line" | awk '{print $1, $2}')")
    else
        commands+=("$(echo "$line" | awk '{print $1}')");
    fi
done <<< $(history | grep -v "history" | cut -d" " -f3-)

# Instead of piping a history command into a while loop, the "<<<"
# is used to redirect the history command into the while loop
# without creating a subshell.

echo "${commands[*]}" | sort | uniq -c | sort -rn | head -25
