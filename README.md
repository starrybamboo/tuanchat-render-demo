# tuanchat-render-demo

这是一个基于 WebGAL 的静态网页渲染 demo 项目，已准备好部署到 GitHub Pages。

部署方法 (两种方式)：

1. 使用 GitHub CLI 自动创建并推送到仓库（推荐）

   先确保 `git` 与 `gh` (GitHub CLI) 已经安装并登录：

```powershell
git init
git add --all
git commit -m "Initial commit: prepare for GitHub Pages"
# 使用你的 GitHub 用户名创建远程仓库并推送（替换为你的用户名）
gh repo create starrybamboo/tuanchat-render-demo --public --source=. --remote=origin --push
```

2. 手动创建仓库并推送：

  - 登录 https://github.com 创建一个新的公共仓库，仓库名 `tuanchat-render-demo`。
  - 本地执行：

```powershell
git init
git add --all
git commit -m "Initial commit: prepare for GitHub Pages"
# 如果已添加了错误的 origin，请先修改 remote 或删除并重新添加
git remote set-url origin https://github.com/starrybamboo/tuanchat-render-demo.git
# 或 (如果 remote 已存在并需要删除)
# git remote remove origin
# git remote add origin https://github.com/starrybamboo/tuanchat-render-demo.git
git branch -M main
git push -u origin main
```

完成后（第一次 push 到仓库后），GitHub Pages 将自动托管仓库中被选为 Pages 源（`gh-pages` 分支、`main` 分支或 `docs/` 目录）的内容，生成页面 URL（通常为 https://<USERNAME>.github.io/tuanchat-render-demo/）。

确认部署状态：

- 进入 `Settings -> Pages` 查看是否配置了正确的 Source（`gh-pages` 分支 或 `main`/`docs`）并记录页面 URL。
- 访问页面 URL，确认 `index.html` 能正常加载并且所有资源链接正确。

常见问题：

- 如果页面资源无法加载，请确认资源的引用路径是相对路径，并且不存在以斜杠或外部域名为起始的绝对路径。
 - 如果页面没有正确发布或提示 404，请先确认：
   - `gh-pages` 分支或你选择发布的分支确实存在并包含 `index.html` 与资源（在仓库的 `Branches` 或 `gh-pages` 分支内检查）。
   - 仓库为 Public，否则 GitHub Pages 可能有额外限制（但通常 private repos 也可以 Pages，取决于设置）。
   - Pages Source 已正确保存并启用（在 Settings -> Pages 中）。

手动触发部署（可选）：

```powershell
# 1. 本地修改后
git add .
git commit -m "Update the site"
git push
# 触发后 GitHub Pages 会根据选中的 Source 自动发布
```

常见错误 — 400 Bad Request（示例：您遇到的情况）：

- 原因：通常是因为远程仓库 url 使用了占位符 `<YOUR_USERNAME>`、拼写错误（例如 `.gi`），或是远程仓库不存在。
- 处理步骤：

```powershell
# 1) 查看当前远程
git remote -v

# 2) 如果 remote 指向错误的 URL（例如含 `<YOUR_USERNAME>`），修改远程为正确地址：
git remote set-url origin https://github.com/starrybamboo/tuanchat-render-demo.git

# 或者先删除再添加：
git remote remove origin
git remote add origin https://github.com/starrybamboo/tuanchat-render-demo.git

# 3) 如果远程仓库不存在，请先创建（网页创建或使用 gh）：
gh repo create starrybamboo/tuanchat-render-demo --public --source=. --remote=origin --push

# 4) 推送分支
git push -u origin main
```

如果您不想使用 `gh`，请在 https://github.com 上手动创建仓库 `starrybamboo/tuanchat-render-demo`，然后按照上面 `git remote add` 的步骤来推送。



注意：

- 该项目的入口文件是 `index.html`（根目录），所有资源都是相对路径，因此适合直接部署到 GitHub Pages。 
 - 项目不再使用 GitHub Actions 的 CD 部署工作流（已禁用）。
   - 如果你想直接使用 GitHub Pages 的自动发布，请在仓库 Settings -> Pages 中设置 Source：
     - `gh-pages` 分支（已被部署内容），或
     - `main` 分支根目录，或
     - `main`/`docs` 目录。
   - GitHub 会自动托管所选分支/目录，无需 CI 来执行发布步骤。

  如果你遇到 Pages 发布失败或 403 错误，请按以下步骤排查：
  - 确认 `gh-pages` 分支存在并包含 `index.html` 与相应资源；
  - 检查 Pages Source（Settings -> Pages）是否正确设置为 `gh-pages`/`main`/`docs` 并保存；
  - 如有分支保护或特殊工作流权限限制，请根据 repository 设置做出相应调整；
  - 如需强制重新部署，可在本地提交空提交并 push：
  ```powershell
  git commit --allow-empty -m "Trigger GH Pages redeploy"
  git push
  ```
- 如果希望部署到 `docs/`，可将内容移动到 `docs/` 并在仓库 Settings -> Pages 中将 Source 设置为 `main` / `docs`。

如果需要，我可以帮您：
- 调整 `publish_dir` 发布到 `docs` 并移动文件到 `docs`。
- 自动化创建 repo 并推送（需您授权 gh 命令或提供 repo 访问）。

祝您部署成功！
