ACTION=$1
BASTIONNAME=$2

case $ACTION in
  create)
    # Create a keypair used for the Udagram bastion host
    aws ec2 create-key-pair --key-name $2 --query 'KeyMaterial' --output text > "$2.pem"

    # Move the private key to the local machine
    mv "$2.pem" ~/.ssh/

    # Push the public key to AWS SSM Parameter Store
    aws ssm put-parameter --name $2 --value "$(cat ~/.ssh/$2.pem)" --type SecureString --overwrite
    ;;

  delete)
    # Deletes the keypair used for the Udagram bastion host
    aws ec2 delete-key-pair --key-name $2
    aws ssm delete-parameter --name $2

    # Delete the private key from the local machine
    rm ~/.ssh/$2*
    ;;

  *)
    echo -n "invalid action, expecting (create | delete)"
    ;;
esac