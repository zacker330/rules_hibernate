
load("@bazel_tools//tools/jdk:toolchain_utils.bzl", "find_java_toolchain")
load("@bazel_skylib//lib:shell.bzl", "shell")

def _hibernate_ddl_impl(ctx):
  output = ctx.actions.declare_file(ctx.label.name + ".sql")
  entity_lib_path = ctx.file.entity_lib.path
  args = ctx.actions.args()

  args.add("--main_advice_classpath=" + ctx.file.entity_lib.path)
  args.add('dialect', ctx.attr.dialect)
  args.add('format', ctx.attr.format)
  args.add('delimiter', ctx.attr.delimiter)
  args.add('outputFile', output.path)
  args.add('haltOnError', ctx.attr.haltOnError)
  args.add('packages', ",".join([package for package in ctx.attr.packages]))

  runfiles = ctx.runfiles(files = [ctx.file.entity_lib] + [output])

  ctx.actions.run(
        inputs = depset(
             direct = [ctx.file.entity_lib],
         ),
        outputs = [output],
        arguments = [args],
        progress_message = "Generate sql from entity:{} to {}".format(entity_lib_path, output.path),
        executable = ctx.executable._executable,
        mnemonic = "HibernateSchemaDDL",
  )
  return [
      DefaultInfo(
        runfiles = runfiles
      )
  ]


hibernate_ddl = rule(
  implementation = _hibernate_ddl_impl,
  attrs = {
    "format": attr.bool(
      default = True,
    ),
    "haltOnError": attr.bool(
      default = True,
    ),
    "delimiter": attr.string(
      default = ";"
    ),
    "dialect": attr.string(
        mandatory = True,
    ),
    "packages":attr.string_list(
        mandatory = True,
    ),
    "entity_lib":attr.label(
      mandatory = True,
      allow_single_file = True,
    ),
    "_executable": attr.label(
      cfg="host",
      executable = True,
      default="@io_bazel_rules_hibernate//internal:SchemaGeneratorCommand"
    ),
    "_java_toolchain": attr.label(
      default = "@bazel_tools//tools/jdk:current_java_toolchain",
    ),
    "_jdk": attr.label(
        default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
        providers = [java_common.JavaRuntimeInfo],
    ),
  },
  fragments = ["java"],
  # # provides = [JavaInfo],
  # toolchains = [
  #       "@bazel_tools//tools/jdk:toolchain_type",
  # ],
)


