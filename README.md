# TaCZ枪包构建工具 | TaCZ Pack Build Kit

[中文](#TaCZ枪包构建工具) | [English](#tacz-pack-built-kit)

# TaCZ枪包构建工具

## 介绍

适用于 [TaCZ](https://github.com/MCModderAnchor/TACZ) 的 Minecraft 枪包构建工具，一键构建多种枪包安装方式（`.jar 模组`/`数据包`/`资源包`/`./tacz/`）。

## 使用说明

### ⭐准备Java环境（1️⃣/3）

- 本工具使用 Java 17 进行构建，请确保本地已安装 Java 17

> 可以使用以下命令检查 Java 版本：
> ```shell
> java --version
> ```

### ⭐初始配置（2️⃣/3）

1. 下载[模板文件](https://github.com/XColorful/TaCZ-PBK/archive/refs/heads/main.zip)（本页面的`<>Code`->`Download ZIP`）
2. 配置`gradle.properties`：
	- 根据文件中的注释修改相关配置
3. 修改命名空间：
	- 将`assets/example`、`data/example`分别重命名为`assets/{namespace}`和`data/{namespace}`

### ⭐构建方式（3️⃣/3）

任选以下一种方式：
- 在 Windows 下运行`build.cmd`
- 或者，在 Intellij IDEA 中用 JDK 17 执行 Gradle 的 `build` 任务

构建产物将输出至`build/libs`：
- `{file_name}.jar`：模组（同时包含数据包+资源包）
- `{file_name}-datapack.zip`：数据包
- `{file_name}-resourcepack.zip`：资源包
- `{file_name}.zip`：用于`./tacz/`目录的枪包（同时包含数据包+资源包）

## 已有枪包的迁移

### 单个枪包

- 将原本放置于`./tacz/`的枪包解压到模板文件夹根目录

然后，任选以下一种方式：
- 在 Windows 下运行`migration.cmd`
- 或者，在 Intellij IDEA 中用 JDK 17 执行 Gradle 的 `migration` 任务

### 批量转换

任选以下一种方式：
- 在 Windows 下运行`batch_convert.cmd`
- 或者，在 Intellij IDEA 中用 JDK 17 执行 Gradle 的 `batch_convert` 任务

然后，输入`版本文件夹`并等待转换完成
- 转换成功的枪包将自动放入`./mods/`，并在`./tacz-backup/`生成回滚备份

## 用途

1. 玩家操作更便利：
	- `.jar`**无需玩家手动复制到./tacz/目录**，启动器可自动检测更新并下载
	- 可以在`mods.toml`/`neoforge.mods.toml`添加其他前置模组依赖，启动器自动识别下载
2. 降低整合包大小：
	- 服务端不使用`资源包`，仅安装`数据包`可以显著降低服务端整合包体积
3. 多种枪包加载策略并存：
	- 可对各存档单独指定整合的`数据包`，配合`.jar`/`资源包`可单独加载部分枪包资源包
	- 对不同存档实现定制枪包整合

# TaCZ Pack Build Kit

## Introduction

A Minecraft gun pack build tool designed for [TaCZ](https://github.com/MCModderAnchor/TACZ), enabling one-click builds with multiple pack installation methods (`.jar mod`/`datapack`/`resourcepack`/`./tacz/`).

## Usage

### ⭐ Set Up Java (1️⃣/3)

- This tool requires Java 17 for building. Make sure Java 17 is installed on your system.

> Run the following command to check your Java version:
> ```shell
> java --version
> ```

### ⭐ Configure the Project (2️⃣/3)

1. Download the [template files](https://github.com/XColorful/TaCZ-PBK/archive/refs/heads/main.zip) (via `<>Code` -> `Download ZIP` on this page).
2. Configure `gradle.properties`:
	- Adjust the settings according to the comments in the file.
3. Set the namespace:
	- Rename `assets/example` and `data/example` to `assets/{namespace}` and `data/{namespace}`, respectively.

### ⭐ Build the Pack (3️⃣/3)

Choose either of the following methods:
- Run `build.cmd` on Windows.
- Alternatively, open the project in IntelliJ IDEA and run the Gradle `build` task using JDK 17.

Build artifacts will be generated in `build/libs`:
- `{file_name}.jar`: Mod (includes both the data pack and resource pack).
- `{file_name}-datapack.zip`: Data pack.
- `{file_name}-resourcepack.zip`: Resource pack.
- `{file_name}.zip`: Gun pack for the `./tacz/` directory (includes both datapack + resourcepack).

## Migrating Existing Gun Packs

### Single Gun Pack

- Extract the gun pack originally placed in `./tacz/` directly into the root directory of the template folder.

Then, choose either of the following methods:
- Run `migration.cmd` on Windows.
- Alternatively, open the project in IntelliJ IDEA and run the Gradle `migration` task using JDK 17.

### Batch Conversion

Choose either of the following methods:
- Run `batch_convert.cmd` on Windows.
- Alternatively, open the project in IntelliJ IDEA and run the Gradle `batch_convert` task using JDK 17.

Then, enter the `version folder` and wait for the conversion to complete
- Successfully converted gun packs will be automatically placed in `./mods/`, and a rollback backup will be generated in `./tacz-backup/`.

## Purpose

1. Convenient player operations:
	- `.jar` **requires no manual copying to `./tacz/` by players**; launchers can automatically detect updates and download them.
	- Dependencies for other prerequisite mods can be added to `mods.toml`/`neoforge.mods.toml`, allowing launchers to recognize and download them automatically.
2. Reduce modpack size:
	- Servers do not need `resourcepacks`; installing only `datapacks` significantly reduces server modpack size.
3. Coexistence of multiple pack loading strategies:
	- Specific integrated `datapacks` can be designated for individual saves, and paired with `.jar`/`resourcepacks` to selectively load parts of gun pack resourcepacks.
	- Achieve customized gun pack integration for different save files.