---
name: crdesign
description: "CRDesign Web 设计规范与组件库。面向 Vue 3 + ant-design-vue 3.x 的中后台与企业站点实现，强制使用统一 token、统一间距、统一布局节奏。生成代码时优先使用 ant-design-vue 3.x 组件与 CRDesign token，不允许脱离体系写任意像素值。Actions: build, design, implement, review, fix, check。"
---

# CRDesign Web Skill

CRDesign 是一套面向 Web 端的设计与实现规则。本 skill 用于约束 AI 在 Vue 3 项目中输出符合 CRDesign 的页面结构、组件选择、间距系统与样式 token。

## 技术基线

- 目标框架：Vue 3
- 组件库：`ant-design-vue 3.x`
- 图标库：`@ant-design/icons-vue 6.x`
- 适用范围：Web 页面、官网、专题页、中后台、工作台、看板页
- 不适用范围：移动端专属页面、原生 App、小程序专属规范

## 核心规则

生成 UI 代码时，必须遵守以下优先级：

1. 匹配到 `ant-design-vue 3.x` 组件时，优先直接使用官方组件。
2. 样式优先通过 CRDesign token、Less 变量覆盖、局部 class 语义化封装实现。
3. 当组件库没有现成组件时，才允许用语义化 HTML + CRDesign token 补充实现。
4. 不允许为了局部效果绕开 spacing/layout/token 体系。
5. 不允许输出未定义的任意像素值。

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

## 版本对齐要求

- 本 skill 以 `ant-design-vue 3.x` 为准，不按 `4.x` token API 编写主题说明。
- 不要输出仅属于更高版本的主题写法作为默认方案。
- 若项目中实际安装版本高于或低于 `3.x`，先保持组件与 API 兼容，再决定是否局部调整。
- 若用户没有特别说明，默认按中后台 Web 项目理解。

## 推荐引入方式

```ts
import { createApp } from 'vue'
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
import App from './App.vue'

const app = createApp(App)

app.use(Antd)
app.mount('#app')
```

## 主题策略

`ant-design-vue 3.x` 项目默认采用以下方式定制视觉：

1. 保留官方组件结构与交互。
2. 用 CRDesign CSS 变量承接品牌色、圆角、阴影、字体、间距。
3. 需要全局覆盖时，优先使用项目级 Less 变量或统一主题入口。
4. 组件局部样式只做必要覆盖，不改写组件基础行为。

## CRDesign Token

```css
:root {
  /* brand */
  --cr-brand-1: #fff8e8;
  --cr-brand-2: #feeac3;
  --cr-brand-3: #fdda9f;
  --cr-brand-4: #fbc87a;
  --cr-brand-5: #fab357;
  --cr-brand-6: #f99d33;
  --cr-brand-7: #e67d00;
  --cr-brand-8: #c56000;
  --cr-brand-9: #893b00;
  --cr-brand-10: #602500;

  /* gray */
  --cr-gray-1: #fafafa;
  --cr-gray-2: #f5f5f5;
  --cr-gray-3: #eeeeee;
  --cr-gray-4: #e7e7e7;
  --cr-gray-5: #dcdcdc;
  --cr-gray-6: #cacaca;
  --cr-gray-7: #a6a6a6;
  --cr-gray-8: #777777;
  --cr-gray-9: #4b4b4b;
  --cr-gray-10: #383838;
  --cr-gray-11: #242424;
  --cr-gray-12: #181818;

  /* semantic */
  --cr-success-6: #4dac39;
  --cr-warning-6: #f7ba1e;
  --cr-error-6: #f53f3f;
  --cr-cyanblue-6: #13a8a8;
  --cr-purple-6: #722ed1;
  --cr-orange-6: #fa541c;

  /* text */
  --cr-font-1: rgba(0, 0, 0, 0.9);
  --cr-font-2: rgba(0, 0, 0, 0.6);
  --cr-font-3: rgba(0, 0, 0, 0.4);
  --cr-font-4: rgba(0, 0, 0, 0.25);
  --cr-font-white-1: rgba(255, 255, 255, 0.9);
  --cr-font-white-2: rgba(255, 255, 255, 0.6);

  /* radius */
  --cr-radius-xs: 2px;
  --cr-radius-sm: 4px;
  --cr-radius-md: 6px;
  --cr-radius-lg: 8px;
  --cr-radius-xl: 12px;
  --cr-radius-2xl: 16px;
  --cr-radius-3xl: 24px;

  /* shadow */
  --cr-shadow-1: 0 1px 2px 0 rgba(0, 0, 0, 0.03), 0 1px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px 0 rgba(0, 0, 0, 0.02);
  --cr-shadow-2: 0 6px 16px 0 rgba(0, 0, 0, 0.08), 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 9px 28px 8px rgba(0, 0, 0, 0.05);
  --cr-shadow-3: 0 6px 16px 0 rgba(0, 0, 0, 0.32), 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 9px 28px 8px rgba(0, 0, 0, 0.05);

  /* typography */
  --cr-font-family: "PingFang SC", system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  --cr-font-h1: 500 36px/44px var(--cr-font-family);
  --cr-font-h2: 500 32px/40px var(--cr-font-family);
  --cr-font-h3: 500 24px/32px var(--cr-font-family);
  --cr-font-h4: 500 18px/26px var(--cr-font-family);
  --cr-font-h5: 500 16px/24px var(--cr-font-family);
  --cr-font-h6: 500 14px/22px var(--cr-font-family);
  --cr-font-body: 400 14px/22px var(--cr-font-family);
  --cr-font-caption: 400 12px/20px var(--cr-font-family);

  /* spacing */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-7: 32px;
  --space-8: 40px;
  --space-9: 48px;
  --space-10: 64px;

  /* layout */
  --layout-content-narrow: 960px;
  --layout-content-default: 1200px;
  --layout-content-wide: 1360px;
  --layout-content-fluid: 100%;

  --layout-page-padding-desktop-sm: 24px;
  --layout-page-padding-desktop-md: 32px;
  --layout-page-padding-desktop-lg: 40px;
  --layout-page-padding-narrow: 20px;
  --layout-page-padding-narrow-lg: 24px;

  --grid-gutter-sm: 16px;
  --grid-gutter-md: 24px;
  --grid-gutter-lg: 32px;

  --breakpoint-sm: 576px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 992px;
  --breakpoint-xl: 1200px;
  --breakpoint-xxl: 1440px;

  --cr-bg: #ffffff;
  --cr-bg-secondary: #fafafa;
  --cr-border: #e7e7e7;
}
```

## 间距与布局规范

### 1. 全局原则

- 所有间距必须使用统一尺度，不使用随意数值。
- 所有页面必须优先遵循统一容器、统一栅格、统一模块节奏。
- 页面级留白与布局节奏必须分层使用。
- 响应式场景下，优先压缩布局层级与模块间距，再压缩页面外边距。
- 所有规则优先输出为可复用 token 或变量。

### 2. 基础单位

- 基准单位：`4px`
- 主节奏单位：`8px`
- 禁止使用无体系数值，例如：`5px`、`7px`、`13px`、`18px`

### 3. 间距等级

| Token | 数值 | 用途 |
|---|---:|---|
| `space-1` | 4px | 微间距、细节修正 |
| `space-2` | 8px | 文字层级的近距离分隔 |
| `space-3` | 12px | 小分组间距 |
| `space-4` | 16px | 常规模块间距 |
| `space-5` | 20px | 辅助过渡间距 |
| `space-6` | 24px | 模块分组间距、内容区上下留白 |
| `space-7` | 32px | 页面区块留白 |
| `space-8` | 40px | 大模块留白 |
| `space-9` | 48px | 首屏与页面主模块分隔 |
| `space-10` | 64px | 超大区块留白 |

### 4. 页面容器

| Token | 数值 | 用途 |
|---|---:|---|
| `layout-content-narrow` | 960px | 表单页、说明页、窄内容页 |
| `layout-content-default` | 1200px | 官网、企业站点、标准业务页 |
| `layout-content-wide` | 1360px | 数据密度较高页面、看板页 |
| `layout-content-fluid` | 100% | 全宽工作台、地图、大屏页面 |

### 5. 页面边距

| Token | 数值 | 用途 |
|---|---:|---|
| `layout-page-padding-desktop-sm` | 24px | 内容密度高的中后台、表格页、工作台 |
| `layout-page-padding-desktop-md` | 32px | 大多数常规页面，如官网内页、详情页 |
| `layout-page-padding-desktop-lg` | 40px | 更强调品牌感与呼吸感的首页、专题页、营销页 |
| `layout-page-padding-narrow` | 20px | 窄视口下的常规页面 |
| `layout-page-padding-narrow-lg` | 24px | 窄视口下仍需保留较强留白感的页面 |

### 6. 页面垂直节奏

| 场景 | 数值 |
|---|---:|
| 标题与副标题 | 8px |
| 标题区与主内容区 | 24px |
| 模块内部大分组 | 24px |
| 卡片与卡片之间 | 16px / 24px |
| 筛选区与表格区 | 16px / 24px |
| 页面末尾与最后模块 | 40px / 48px |

### 7. 栅格系统

- 官网、专题页默认使用 `12` 栅格。
- 中后台、工作台、看板默认使用 `24` 栅格。
- 同一主内容区域内不得混用多套主栅格。

| Token | 数值 |
|---|---|
| `grid-columns-marketing` | 12 |
| `grid-columns-system` | 24 |
| `grid-gutter-sm` | 16px |
| `grid-gutter-md` | 24px |
| `grid-gutter-lg` | 32px |

### 8. 常见布局比例

- 双栏布局：`6:6`、`8:4`、`9:3`
- 三栏布局：`4:4:4`、`6:9:9`
- 工作台布局：`5:19`、`6:18`
- 表单详情布局：`8:16`、`12:12`

### 9. 响应式断点

| Token | 宽度 |
|---|---|
| `breakpoint-xs` | `< 576px` |
| `breakpoint-sm` | `>= 576px` |
| `breakpoint-md` | `>= 768px` |
| `breakpoint-lg` | `>= 992px` |
| `breakpoint-xl` | `>= 1200px` |
| `breakpoint-xxl` | `>= 1440px` |

### 10. 响应式规则

- 窄视口优先减少横向分栏，改为纵向堆叠。
- 缩小视口时，先压缩模块间距，再压缩页面外边距。
- 复杂表格在窄视口下可切换为卡片式结构。
- 图表区块在窄视口下允许减少并列列数。
- 操作区在窄视口下优先保留主操作，弱化次操作。

### 11. 组件间距

| 场景 | 规则 |
|---|---|
| 按钮组 | `12px` |
| 标签组 | `8px` |
| 表单项之间 | `16px` 或 `24px` |
| 工具栏控件之间 | `8px` 或 `12px` |
| 卡片列表之间 | `16px` 或 `24px` |
| 图文模块之间 | `16px` 或 `24px` |
| 图表卡片之间 | `24px` |

### 12. 约束规则

- 所有页面必须从页面容器、栅格和模块节奏开始设计。
- 未经明确授权，不新增临时 spacing 值。
- 相同层级页面模块必须保持一致的间距规则。
- 布局规则不得因局部内容长短随意脱离既定 spacing 体系。

## 组件使用规则

### 布局类组件

- 页面骨架优先使用 `a-layout`、`a-row`、`a-col`、`a-card`、`a-space`。
- 栅格 gutter 默认优先使用 `16`、`24`、`32`。
- 中后台主内容区优先使用 `24` 栅格。
- 官网与专题页优先使用 `12` 栅格概念组织内容。

```vue
<a-row :gutter="[24, 24]">
  <a-col :xs="24" :lg="8">
    <a-card title="模块 A" />
  </a-col>
  <a-col :xs="24" :lg="16">
    <a-card title="模块 B" />
  </a-col>
</a-row>
```

### 表单类组件

- 表单优先使用 `a-form`、`a-form-item`、`a-input`、`a-select`、`a-date-picker`、`a-radio-group`、`a-checkbox-group`。
- 表单项垂直间距优先使用 `16px` 或 `24px`。
- 搜索筛选区与结果区之间优先留 `16px` 或 `24px`。

### 数据展示类组件

- 表格优先使用 `a-table`，不要手写表格骨架替代。
- 标签优先使用 `a-tag`，状态提示优先使用 `a-alert`、`a-badge`、`a-result`。
- 统计卡、图表卡、明细卡之间遵循统一卡片间距。

### 操作反馈类组件

- 消息反馈优先使用 `message`、`notification`、`a-modal`。
- 危险操作必须使用明确的二次确认，不要只靠颜色提醒。

## 推荐页面骨架

```vue
<template>
  <section class="cr-page">
    <header class="cr-page__header">
      <div>
        <h1 class="cr-page__title">页面标题</h1>
        <p class="cr-page__subtitle">页面说明文案</p>
      </div>
      <a-space :size="12">
        <a-button>取消</a-button>
        <a-button type="primary">保存</a-button>
      </a-space>
    </header>

    <a-row :gutter="[24, 24]">
      <a-col :span="24">
        <a-card title="主要内容">
          内容区
        </a-card>
      </a-col>
    </a-row>
  </section>
</template>

<style scoped>
.cr-page {
  max-width: var(--layout-content-default);
  margin: 0 auto;
  padding: var(--space-6) var(--layout-page-padding-desktop-md) var(--space-9);
}

.cr-page__header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: var(--space-6);
  margin-bottom: var(--space-6);
}

.cr-page__title {
  margin: 0;
  font: var(--cr-font-h2);
  color: var(--cr-font-1);
}

.cr-page__subtitle {
  margin: var(--space-2) 0 0;
  font: var(--cr-font-body);
  color: var(--cr-font-2);
}
</style>
```

## 输出要求

当基于本 skill 生成页面结构、设计规范或前端代码时，必须满足以下要求：

- 使用统一 spacing token 命名。
- 使用统一 layout token 命名。
- 明确页面容器宽度。
- 明确栅格列数与 gutter。
- 明确主要模块的上下间距。
- 明确组件之间的间距。
- 明确响应式收缩策略。
- 不输出未定义的任意像素值。
- 没有必要时，不新增一层纯装饰容器。

## 禁止事项

- 禁止手写与 `ant-design-vue 3.x` 组件功能重复的纯 HTML 组件。
- 禁止默认使用 antd 蓝色 `#1890ff` 作为主品牌色。
- 禁止脱离 token 体系直接写任意颜色、圆角、阴影、间距。
- 禁止出现 `5px`、`7px`、`13px`、`18px` 这类无体系值。
- 禁止因为局部内容长短临时改动整页 spacing 逻辑。
- 禁止在同一主内容区同时混用多套主栅格。
- 禁止为了“看起来对齐”堆砌无语义空节点。

## AI 执行提示

当用户要求“用 CRDesign 做一个页面 / 组件 / 表单 / 工作台”时，按下面流程执行：

1. 先判断页面类型：营销页、详情页、表单页、工作台、看板。
2. 先定容器宽度，再定栅格列数，再定模块上下节奏。
3. 再选择 `ant-design-vue 3.x` 组件完成骨架。
4. 最后使用 CRDesign token 收敛视觉细节。

若用户没有特别指定：

- 默认页面宽度使用 `layout-content-default`
- 默认页边距使用 `layout-page-padding-desktop-md`
- 默认栅格 gutter 使用 `grid-gutter-md`
- 默认模块分组间距使用 `space-6`

## 更新与版本管理

- 当前版本信息存放在 `data/version.json`。
- 当用户说“更新 CRDesign skill”时，执行 `scripts/update.sh`。
- 主版本号用于不兼容规则调整。
- 次版本号用于新增规则、token、页面规范。
- 修订号用于文案修正和小范围兼容更新。
