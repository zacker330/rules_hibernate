workspace(name = "io_bazel_rules_hibernate")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@io_bazel_rules_hibernate//:deps.bzl", "hibernate_rules_dependencies", "hibernate_install_dependencies")

hibernate_rules_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")

hibernate_install_dependencies(maven_install);
