STACK_NAME="TEST-STACK"

delete-all:
	@aws cloudformation list-stacks | grep StackName | awk '{ print $$2 }' | sed -e 's/\"//g' -e 's/,//g' | \xargs -I '{}' aws cloudformation delete-stack --stack-name {}
	s3cmd ls | awk '{ print $$3 }' | \xargs -I '{}'  s3cmd rb -r {}

validate:
	@for i in $$(ls -1 output/*template)  ; do\
		template=$$(cat $$i) ;\
		aws cloudformation validate-template --template-body "$$template" ;\
	done

delete:
	@aws cloudformation delete-stack --stack-name ${STACK_NAME}

create:
	@aws cloudformation create-stack --stack-name ${STACK_NAME} --template-body "`cat output/main.template`"

describe:
	@aws cloudformation describe-stack-events --stack-name ${STACK_NAME}

output:
	@aws cloudformation describe-stacks --stack-name ${STACK_NAME} | JSON.sh | egrep '\["Stacks",0,"Outputs"]'


.PHONY: output
