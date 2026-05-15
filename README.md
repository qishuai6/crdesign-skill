# CRDesign Skill

CRDesign Web Skill，面向 `Vue 3 + ant-design-vue 3.x` 的设计规范与实现约束。它用于让 AI 生成符合 CRDesign 规则的 Web 页面、表单、工作台和中后台界面。

## 这次版本的重点

- 技术基线统一为 `ant-design-vue 3.x`
- 补齐完整的间距与布局规范
- 新增 spacing、layout、grid、breakpoint 结构化 token
- 去掉偏 `4.x` 主题 token API 的默认表述，避免误导

## 安装

```bash
git clone https://github.com/qishuai6/crdesign-skill.git ~/.claude/skills/crdesign
```

安装后，Claude Code / Codex 在引用 CRDesign skill 生成 Web 前端代码时，会自动优先遵循：

- `ant-design-vue 3.x` 组件优先
- 统一 spacing token
- 统一 layout token
- 统一栅格与响应式节奏

## 更新

```bash
bash ~/.claude/skills/crdesign/scripts/update.sh check
bash ~/.claude/skills/crdesign/scripts/update.sh update
bash ~/.claude/skills/crdesign/scripts/update.sh version
bash ~/.claude/skills/crdesign/scripts/update.sh changelog
```

## 目录结构

```text
crdesign-skill/
├── SKILL.md
├── README.md
├── scripts/
│   └── update.sh
└── data/
    ├── tokens.json
    └── version.json
```

## 依赖基线

```json
{
  "dependencies": {
    "vue": "^3.3.0",
    "ant-design-vue": "^3.2.0",
    "@ant-design/icons-vue": "^6.1.0"
  }
}
```

## 规则摘要

- 所有间距必须落到 token，不允许任意像素值
- 页面必须先定容器、栅格、模块节奏，再写组件
- Web 页面优先使用 `a-layout`、`a-row`、`a-col`、`a-card`、`a-form`、`a-table`
- 主题定制优先使用 CRDesign token 与统一样式入口
- 默认品牌主色为 `#F99D33`，不是 antd 默认蓝

## 数据文件

- [SKILL.md](./SKILL.md)
- [tokens.json](./data/tokens.json)
- [version.json](./data/version.json)

## License

MIT
