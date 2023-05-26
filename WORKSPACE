workspace(name = "io_bazel_rules_hibernate")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@io_bazel_rules_hibernate//:deps.bzl", "hibernate_rules_dependencies")

hibernate_rules_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")


SPRING_BOOT_VERSION = "2.1.3.RELEASE"
SPRING_VERSION = "5.1.5.RELEASE"
HBERNATE_VERSION = "6.2.0.Final"

maven_install(
    artifacts = [

        "org.hibernate.orm:hibernate-ant:6.2.0.Final",
        "org.hibernate.orm:hibernate-core:6.2.0.Final",
        "jakarta.persistence:jakarta.persistence-api:3.1.0",
        "org.reflections:reflections:0.10.2",


    ],
    fetch_sources = False,
    # maven_install_json = "//:maven_install.json",
    repositories = [
        "https://maven.aliyun.com/repository/public",
#        "https://repo1.maven.org/maven2",
    ],
    # version_conflict_policy = "pinned",
)

