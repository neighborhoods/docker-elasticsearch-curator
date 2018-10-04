# docker-elasticsearch-curator

This is a Docker container image containing a specific version of [Curator](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/about.html), 
a tool used to manage Elasticsearch indices. We're using [Pipenv](https://pipenv.readthedocs.io/en/latest/) to pin Curator
and all of its sub-dependencies. Building this container image is simply a matter of taking a Lockfile and setting up a Python environment which matches its requirements.

## Usage
There are two files which are required for Curator to work: a [(YAML) config file](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/configfile.html) 
and a [(YAML) Actionfile](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/actionfile.html). Both of these should be mounted into the container at runtime, for example:

```
docker run \
  -v ~/config.yaml:/curator/config.yaml \
  -v ~/action.yaml:/curator/action.yaml \
  neighborhoods/elasticsearch-curator --config /curator/config.yaml /curator/action.yaml
```
