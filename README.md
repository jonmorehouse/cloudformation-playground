CloudFormation Playground
=========================

A work environment for building out cloudformation files / testing them at speed.

This project uses CSON and allows for requiring CSON files so you can have base templates for CloudFormation projects.

Getting Started
---------------

* make sure you have the AWS cli tools installed
  `pip install awscli`
* make sure you have node.js installed
  `brew install node`
* bootstrap environment
  `cd cloudformation-playground && npm install`
* build files
  `cake build`
* test files
  `cake test`

Note, you may get some weird errors if you haven't used the aws cloudformation cli before. Make sure you have set the correct ENV variables [AWS_DEFAULT_REGION, AWS_ACCESS_KEY, AWS_SECRET_ACCESS_KEY ...]



