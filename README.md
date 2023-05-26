# Bazel Rules for Hibernate

## Usage
```python

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_hibernate",
    sha256 = "19743c6dc8369cadbdb6f8412d056fc9276d5e7ac25bab3bf69daed4a26cf919",
    urls = [ "https://github.com/zacker330/rules_hibernate/releases/download/v0.0.1/rules_hibernate-0.0.1.zip" ],
)

load("@io_bazel_rules_hibernate//:deps.bzl", "hibernate_rules_dependencies")

hibernate_rules_dependencies()
```


### hibernate_ddl example

```python

java_library(
    name = "b_lib",
    srcs = glob(["b/*.java"]),
    deps = [
        "@maven//:jakarta_persistence_jakarta_persistence_api",
        "@maven//:org_hibernate_orm_hibernate_core",
    ],
)

hibernate_ddl(
    name = "b_service",
    entity_lib = ":b_lib",
    packages = ["example.a","example.b"],
    dialect = "org.hibernate.dialect.MySQL8Dialect"
)

```