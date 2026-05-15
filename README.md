# CRDesign Skill

华润医药商业（CRDesign）设计规范 Claude Code Skill，基于 ant-design-vue 4.x 二次封装，用于生成符合品牌规范的 Vue 3 前端代码。

## 安装

```bash
# 克隆到 Claude Code skills 目录
git clone https://github.com/qishuai6/crdesign-skill.git ~/.claude/skills/crdesign
```

安装完成后，在 Claude Code 中生成 Vue 3 UI 代码时，会自动遵循 CRDesign 设计规范。

## 特性

- **全量组件映射** — 覆盖 ant-design-vue 4.x 全部 68 个组件，含 CRDesign 主题配置
- **设计 Token 体系** — 完整的颜色（品牌/灰/成功/警示/错误/青蓝/紫/橙）、排版、圆角、阴影变量
- **ConfigProvider 主题** — 开箱即用的全局主题配置，一键注入 CRDesign 品牌色
- **组件优先** — 强制使用 antd-vue 组件，禁止手写重复功能的纯 CSS/HTML
- **设计数据** — `data/tokens.json` 包含结构化的完整 Token 数据

## 目录结构

```
crdesign-skill/
├── SKILL.md          # Skill 主文件（组件映射 + 规则 + 主题配置）
├── data/
│   └── tokens.json   # 设计 Token 结构化数据
└── README.md
```

## 依赖

```json
{
  "vue": "^3.3",
  "ant-design-vue": "^4.x",
  "@ant-design/icons-vue": "^7.x"
}
```

## 设计 Token 概览

| 类别 | 主色 | 色阶 |
|------|------|------|
| 品牌色 | #F99D33 | 10 级渐变 |
| 灰色 | #CACACA | 12 级渐变 |
| 成功色 | #4DAC39 | 10 级渐变 |
| 警示色 | #F7BA1E | 10 级渐变 |
| 错误色 | #F53F3F | 10 级渐变 |
| 青蓝色 | #13A8A8 | 10 级渐变 |
| 紫色 | #722ED1 | 10 级渐变 |
| 橙色 | #FA541C | 10 级渐变 |

## License

MIT
