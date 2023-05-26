
package(default_visibility = ["//visibility:public"])


java_binary(
    name = "SchemaGeneratorCommand",
    main_class = "internal.SchemaGeneratorCommand",
    srcs = ["SchemaGeneratorCommand.java"],
    deps = [
        "@maven//:org_reflections_reflections",
        "@maven//:org_hibernate_orm_hibernate_ant",
        "@maven//:jakarta_persistence_jakarta_persistence_api",
        "@maven//:org_hibernate_orm_hibernate_core",
    ],
)