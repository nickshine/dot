# DOT

A Docker image for the [Graphviz] DOT CLI.

https://hub.docker.com/r/nshine/dot

* [Graphviz] - Graph Visualization Software
* [DOT] - Graph Description Language

## Usage

### Generate a PNG

```bash
cat graph.dot | docker run --rm -i nshine/dot > graph.png
```

### Generate Other Outputs

```bash
cat graph.dot | docker run --rm -i nshine/dot dot -Tsvg > graph.svg
```

### Use with Terraform Graph

```bash
terraform graph | docker run --rm -i nshine/dot > graph.png
```

### Use in GitLab CI

```yaml

stages:
  - terraform
  - graph

terraform:
  stage: terraform
  image: hashicorp/terraform
  entrypoint: [""]
  script:
    - terraform graph > graph.dot
  archive:
    paths:
      - graph.dot

pages:
  stage: graph
  image: nshine/dot
  dependencies:
    - terraform
  script:
    - mkdir -p public
    - dot -Tpng graph.dot > public/graph.png
    - echo '<html><img src="graph.png" alt="terraform graph"></html>' > public/index.html
  archive:
    paths:
    - public
    expire_in: 1h
```

See the Graphviz [Command-line Invocation][cli-docs] docs for full documentation on the dot cli.

[graphviz]:graphviz.org
[dot]:https://en.wikipedia.org/wiki/DOT_(graph_description_language)
[cli-docs]:https://www.graphviz.org/doc/info/command.html

