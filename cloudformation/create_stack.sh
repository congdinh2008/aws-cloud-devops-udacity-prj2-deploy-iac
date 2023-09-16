ACTION=$1
REGION="us-east-1"

# Define a list of items
# my_list=("s3" "iam" "network" "bastion" "udagram")
my_list=("bastion")

# Loop through the list
for item in "${my_list[@]}"; do
    STACK="${item}-stack"
    TEMPLATE="${item}/${item}.yml"
    PARAMS="${item}/${item}-parameters.json"
    echo "$ACTION stack $STACK from template $TEMPLATE with parameters $PARAMS:"
    source ./stack_manager.sh $ACTION $STACK $TEMPLATE $PARAMS $REGION
    sleep 20
done
