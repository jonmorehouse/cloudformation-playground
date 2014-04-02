CloudFormation
==============

ENV Variables
-------------

* keypair
* aws_access_key, aws_access_secret
* default_region

Tasks (S3)
----------

* create buckets
  * images
  * video
  * clips
  * gifs
  * logs
* link cloudfront to buckets (only the encoding bucket)
  * images
  * gifs
  * videos
* link route53 to cloudfront distribution points

Tasks (Public DNS)
------------------

* create a bastion server (we will tunnel through this)
* create a public ec2 + link with the elastic ip needed

Tasks (Cluster)
---------------

* create vpc
  * create private subnet
  * create public subnet
* security groups (vpc wide)
  * port 80 on public servers 
  * development security group which can have on / off elements as needed

Thoughts
--------

* parameters for staging / non-staging
* parameters for prefix
* parameters for url


