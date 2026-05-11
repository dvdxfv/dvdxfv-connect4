# Runtime entrypoint

- 对外发布入口：安装版 `*setup*.exe` 或 `*安装包*.exe`。
- 当前建议仅发布安装包，不对普通用户分发便携版（避免目录依赖导致“点击无反应”）。
- 若安装时出现 SmartScreen 拦截，按“更多信息 -> 仍要运行”继续。

仓库不提交大体积二进制；打包后的可执行文件通过 GitHub Releases 的 Assets 分发。
