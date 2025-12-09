# tuanchat-render-demo

这是一个基于 WebGAL 的静态网页渲染 demo 项目，已准备好部署到 GitHub Pages。

部署方法 (两种方式)：

1. 使用 GitHub CLI 自动创建并推送到仓库（推荐）

   先确保 `git` 与 `gh` (GitHub CLI) 已经安装并登录：

```powershell
git init
git add --all
git commit -m "Initial commit: prepare for GitHub Pages"
gh repo create <YOUR_USERNAME>/tuanchat-render-demo --public --source=. --remote=origin --push
```

2. 手动创建仓库并推送：

  - 登录 https://github.com 创建一个新的公共仓库，仓库名 `tuanchat-render-demo`。
  - 本地执行：

```powershell
git init
git add --all
git commit -m "Initial commit: prepare for GitHub Pages"
git remote add origin https://github.com/<YOUR_USERNAME>/tuanchat-render-demo.git
git branch -M main
git push -u origin main
```

完成后（第一次 push 到仓库后），GitHub Actions 会自动构建并把站点发布到 `gh-pages` 分支，然后 GitHub Pages 自动托管。您可以在仓库 Settings -> Pages 中查看生效的页面 URL（通常为 https://<USERNAME>.github.io/tuanchat-render-demo/）。

确认部署状态：

- 进入仓库页面，点击 `Actions` 查看 `Deploy to GitHub Pages` 的运行日志，确保 Workflow 成功（绿色）。
- 进入 `Settings -> Pages`，查看 Source 是否选中 `gh-pages` 分支，并记录页面 URL。
- 访问页面 URL，确认 `index.html` 能正常加载并且所有资源链接正确。

常见问题：

- 如果页面资源无法加载，请确认资源的引用路径是相对路径，并且不存在以斜杠或外部域名为起始的绝对路径。
- 如果部署失败并提示权限问题，请前往仓库 `Settings -> Secrets and variables -> Actions`，添加 `PERSONAL_ACCESS_TOKEN` 或使用 `GITHUB_TOKEN` 默认权限（通常足够）。

手动触发部署（可选）：

```powershell
# 1. 本地修改后
git add .
git commit -m "Update the site"
git push
# 触发后 workflow 会自动部署
```


注意：

- 该项目的入口文件是 `index.html`（根目录），所有资源都是相对路径，因此适合直接部署到 GitHub Pages。 
- 工作流文件位于 `.github/workflows/deploy.yml`，会在 push 到 `main` 或 `master` 时把站点内容发布到 `gh-pages` 分支。
- 如果希望部署到 `docs/`，可将内容移动到 `docs/` 或在 workflow 中把 `publish_dir` 改为 `docs/`。

如果需要，我可以帮您：
- 调整 `publish_dir` 发布到 `docs` 并移动文件到 `docs`。
- 自动化创建 repo 并推送（需您授权 gh 命令或提供 repo 访问）。

祝您部署成功！
