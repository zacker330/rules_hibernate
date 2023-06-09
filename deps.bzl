# Copyright Jay Conrod. All rights reserved.

# This file is part of rules_go_simple. Use of this source code is governed by
# the 3-clause BSD license that can be found in the LICENSE.txt file.

"""Macro for declaring repository dependencies."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def hibernate_rules_dependencies():
    """Declares external repositories that rules_go_simple depends on.

    This function should be loaded and called from WORKSPACE of any project
    that uses rules_go_simple.
    """

    # bazel_skylib is a set of libraries that are useful for writing
    # Bazel rules. We use it to handle quoting arguments in shell commands.
    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        ],
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    )
    RULES_JVM_EXTERNAL_TAG = "4.5"
    RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"
    maybe(
        http_archive,
        name = "rules_jvm_external",
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        sha256 = RULES_JVM_EXTERNAL_SHA,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )


def hibernate_install_dependencies(maven_install):

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
    )

