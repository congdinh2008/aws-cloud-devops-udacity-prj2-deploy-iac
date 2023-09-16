ACTION=$1

case $ACTION in
  create)
    aws cloudformation create-stack \
    --stack-name $2 \
    --template-body file://$3 \
    --parameters file://$4 \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    --region=$5
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $2 \
    --template-body file://$3 \
    --parameters file://$4 \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $2 \
    --region=$5
    ;;

  *)
    echo -n "invalid action, expecting (create | update | delete)"
    ;;
esac