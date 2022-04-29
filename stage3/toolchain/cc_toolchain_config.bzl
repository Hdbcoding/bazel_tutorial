# toolchain/cc_toolchain_config.bzl: help with c++ configuration

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "artifact_name_pattern",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/g++",
        ),
        tool_path(
            name = "ld",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/ld",
        ),
        tool_path(
            name = "ar",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/cpp",
        ),
        tool_path(
            name = "gcov",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/gcov",
        ),
        tool_path(
            name = "nm",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/nm",
        ),
        tool_path(
            name = "objdump",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/objdump",
        ),
        tool_path(
            name = "strip",
            path = "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/bin/strip",
        ),
    ]

    features = [
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        cxx_builtin_include_directories = [
            "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/include",
            "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/x86_64-w64-mingw32/include",
            "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed",
            "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/lib/gcc/x86_64-w64-mingw32/8.1.0/include",
            "E:/Program Files/MinGW_w64/x86_64-8.1.0-release-win32-seh-rt_v6/lib/gcc/x86_64-w64-mingw32/8.1.0",
        ],
        toolchain_identifier = "k8-toolchain",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "k8",
        target_libc = "unknown",
        compiler = "clang",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        artifact_name_patterns = [
            artifact_name_pattern(
                category_name = "executable",
                prefix = "",
                extension = ".exe",
            ),
        ],
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
