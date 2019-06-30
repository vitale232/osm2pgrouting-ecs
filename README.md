# osm2pgrouting-ecs
Run the osm2pgrouting algorithm on an ECS instance with datasets that are too large for your local machine's memory

## Why do we need this repo?
I wanted to work with pgrouting using OpenStreetMap data. osm2pgrouting is an easy to use command line tool that reads native .osm XML files, creates a network graph from the data, and loads it into a PostgreSQL database that is PostGIS and pgRouting enabled. The biggest limitation of the software is that the entirety of the dataset must be loaded into the host machine's memory.

I've been doing most of my work on a laptop with 8 GB of RAM. This was not enough to run osm2pgrouting on the Geofabrik New York State OSM extract. Since I'm planning to use an AWS RDS database instance for development, I thought it made sense to provision some temporary AWS resources to run the osm2pgrouting algorithm on my study area.

Two months ago I would have been stuck... Can't load into memory? Guess I need a new computer! Not the case with AWS. This work required about $1 worth of AWS compute using the ECS (Elastic Container Service) Fargate launch type. Fargate uses AWS managed virtual machines to run the Docker image, eliminating the need to provision and manage your own EC2 instance. Once all of the variables are set up, this tool can be executed using the aws/ecs-cli command line interfaces.

As I understand it, it should be possible to create a public Docker image that does not include any private variables from my AWS environment. As a newb to all things cloud, I've decided to skip that step for now and just make the build scripts available. It would be great if someone with more experience could step in and show me the safest way to post a public Docker image that requires AWS passwords during execution, without relying on AWS Key Manager.

## Run instuctions
Under construction...
