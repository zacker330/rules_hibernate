# Bazel Rules for Hibernate


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