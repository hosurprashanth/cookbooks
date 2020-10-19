export PATH=$PATH:/usr/local/bin/:/usr/bin

# Safety feature: exit script if error is returned, or if variables not set.
# Exit if a pipeline results in an error.
set -ue
set -o pipefail

## Variable Declartions ##
bootstrapNodeFileName="/opt/bootstrapNodeFileLinux.csv"

# Set Logging Options


logfileName="/opt/bootstrapNodeLinuxLog_$(date +%Y%m%d).log"
logfileMaxLines="500000"

## Function Declarations ##

# Function: Setup logfile and redirect stdout/stderr.
logSetup() {
    # Check if logfile exists
    ( [ -e "$logfileName" ] || touch "$logfileName" ) && [ ! -w "$logfileName" ] && echo "ERROR: Cannot write to $logfileName. Check permissions or sudo access." && exit 1

    tmplog=$(tail -n $logfileMaxLines $logfileName 2>/dev/null) && echo "${tmplog}" > $logfileName
    exec > >(tee -a $logfileName)
    exec 2>&1
}

# Function: Log an event.
log() {
    echo "[$(date +"%Y-%m-%d"+"%T")]: $*"
}

# Function: Bootstrap all Linux servers provided in the file
bootstrapNodeFileName() {
while read ipAddress keyFile nodeName;do
	log "IP Address is: $ipAddress"
	log "Keyfile is: $keyFile"
	log "NodeName is: $nodeName"
	
	# Bootstrap the node
printf "Y" | sudo knife bootstrap $ipAddress -i /opt/chef-ws/.chef/$keyFile -x ec2-user --run-list 'recipe[appdynamics]' --sudo -N  $nodeName

	log "Bootstrap has been completed for Node: $nodeName"

done < $bootstrapNodeFileName
}

## SCRIPT COMMANDS ##
logSetup
bootstrapNodeFileName

