
load("@io_bazel_rules_hibernate//:rules.bzl", "hibernate_ddl")
package(default_visibility = ["//visibility:public"])

java_library(
    name = "a_lib",
    srcs = glob(["a/Service.java"]),
    deps = [
        "@maven//:jakarta_persistence_jakarta_persistence_api",
        "@maven//:org_hibernate_orm_hibernate_core",
    ],
)

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

hibernate_ddl(
  name = "a_service",
  entity_lib = ":a_lib",
  packages = ["example.a","example.b"],
  dialect = "org.hibernate.dialect.PostgreSQLDialect"
)