ACTION=$1
REGION="us-east-1"
STACK="$2-stack"
TEMPLATE="$2/$2.yml"
PARAMS="$2/$2-parameters.json"


echo "$ACTION stack $STACK from template $TEMPLATE with parameters $PARAMS:"
source ./stack_manager.sh $ACTION $STACK $TEMPLATE $PARAMS $REGION
