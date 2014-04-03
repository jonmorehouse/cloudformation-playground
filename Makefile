delete-stacks:
	aws cloudformation list-stacks | grep StackName | awk '{ print $$2 }' | sed -e 's/\"//g' -e 's/,//g' | \xargs -I '{}' aws cloudformation delete-stack --stack-name {}

create-stack:
	aws cloudformation create-stack --stack-name "temp-test-stack" --template-body "`cat output/main.template`"
