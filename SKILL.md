---
name: crdesign
description: "CRDesign 设计规范与组件库。基于 ant-design-vue 4.x 二次封装，完整 token 体系（颜色/排版/圆角/阴影）+ 全量组件映射（68 个 antd-vue 组件）。生成 Vue 3 代码时优先使用 antd-vue 组件 + CRDesign token 覆盖，禁止纯 CSS 手写重复功能。Actions: build, design, implement, review, fix, check。Elements: 全量 antd-vue 组件。"
---

# CRDesign 设计规范

CRDesign 企业级设计系统，基于 ant-design-vue 4.x 二次封装，用于生成符合品牌规范的 Vue 3 前端代码。

## 核心规则：组件优先

生成 UI 代码时，必须遵守以下优先级：
1. **匹配到 antd-vue 组件 → 直接使用组件**，import from 'ant-design-vue'
2. **样式通过 ConfigProvider 主题 + CSS 变量覆盖**，不硬编码
3. **antd-vue 没有的组件 → 用 CRDesign token 变量写样式**
4. **绝对禁止** 手写与 antd-vue 组件功能重复的纯 CSS/HTML

---

## 依赖

```json
{
  "dependencies": {
    "vue": "^3.3",
    "ant-design-vue": "^4.x",
    "@ant-design/icons-vue": "^7.x"
  }
}
```

---

## CRDesign Token 变量

```css
:root {
  /* 品牌色 brand */
  --cr-brand-1: #FFF8E8;
  --cr-brand-2: #FEEAC3;
  --cr-brand-3: #FDDA9F;
  --cr-brand-4: #FBC87A;
  --cr-brand-5: #FAB357;
  --cr-brand-6: #F99D33;
  --cr-brand-7: #E67D00;
  --cr-brand-8: #C56000;
  --cr-brand-9: #893B00;
  --cr-brand-10: #602500;

  /* 灰色 gray */
  --cr-gray-1: #FAFAFA;
  --cr-gray-2: #F5F5F5;
  --cr-gray-3: #EEEEEE;
  --cr-gray-4: #E7E7E7;
  --cr-gray-5: #DCDCDC;
  --cr-gray-6: #CACACA;
  --cr-gray-7: #A6A6A6;
  --cr-gray-8: #777777;
  --cr-gray-9: #4B4B4B;
  --cr-gray-10: #383838;
  --cr-gray-11: #242424;
  --cr-gray-12: #181818;

  /* 成功色 success */
  --cr-success-1: #F0FFE8;
  --cr-success-2: #CCEEBD;
  --cr-success-3: #AADE97;
  --cr-success-4: #88CD73;
  --cr-success-5: #69BD54;
  --cr-success-6: #4DAC39;
  --cr-success-7: #349425;
  --cr-success-8: #1F7C15;
  --cr-success-9: #0E6408;
  --cr-success-10: #034D00;

  /* 警告色 warning */
  --cr-warning-1: #FFFCE8;
  --cr-warning-2: #FDF4BF;
  --cr-warning-3: #FCE996;
  --cr-warning-4: #FADC6D;
  --cr-warning-5: #F9CC45;
  --cr-warning-6: #F7BA1E;
  --cr-warning-7: #CC9213;
  --cr-warning-8: #A26D0A;
  --cr-warning-9: #774B04;
  --cr-warning-10: #4D2D00;

  /* 错误色 error */
  --cr-error-1: #FFECE8;
  --cr-error-2: #FDCDC5;
  --cr-error-3: #FBACA3;
  --cr-error-4: #F98981;
  --cr-error-5: #F76560;
  --cr-error-6: #F53F3F;
  --cr-error-7: #CB272D;
  --cr-error-8: #A1151E;
  --cr-error-9: #770813;
  --cr-error-10: #4D000A;

  /* 链接色 cyanblue */
  --cr-cyanblue-1: #E6FFFB;
  --cr-cyanblue-2: #B5F5EC;
  --cr-cyanblue-3: #87E8DE;
  --cr-cyanblue-4: #5CDBD3;
  --cr-cyanblue-5: #36CFC9;
  --cr-cyanblue-6: #13A8A8;
  --cr-cyanblue-7: #08979C;
  --cr-cyanblue-8: #006D75;
  --cr-cyanblue-9: #00474F;
  --cr-cyanblue-10: #002329;

  /* 紫色 purple */
  --cr-purple-6: #722ED1;

  /* 橙色 orange */
  --cr-orange-6: #FA541C;

  /* 文字颜色 */
  --cr-font-1: rgba(0, 0, 0, 0.9);
  --cr-font-2: rgba(0, 0, 0, 0.6);
  --cr-font-3: rgba(0, 0, 0, 0.4);
  --cr-font-4: rgba(0, 0, 0, 0.25);
  --cr-font-white-1: rgba(255, 255, 255, 0.9);
  --cr-font-white-2: rgba(255, 255, 255, 0.6);

  /* 圆角（必须是 2 的倍数） */
  --cr-radius-xs: 2px;
  --cr-radius-sm: 4px;
  --cr-radius-md: 6px;
  --cr-radius-lg: 8px;
  --cr-radius-xl: 12px;
  --cr-radius-2xl: 16px;
  --cr-radius-3xl: 24px;

  /* 阴影 */
  --cr-shadow-1: 0 1px 2px 0 rgba(0, 0, 0, 0.03), 0 1px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px 0 rgba(0, 0, 0, 0.02);
  --cr-shadow-2: 0 6px 16px 0 rgba(0, 0, 0, 0.08), 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 9px 28px 8px rgba(0, 0, 0, 0.05);
  --cr-shadow-3: 0 6px 16px 0 rgba(0, 0, 0, 0.32), 0 3px 6px -4px rgba(0, 0, 0, 0.12), 0 9px 28px 8px rgba(0, 0, 0, 0.05);

  /* 排版 */
  --cr-font-family: 'PingFang SC', system-ui, -apple-system, sans-serif;
  --cr-font-h1: 500 36px/44px var(--cr-font-family);
  --cr-font-h2: 500 32px/40px var(--cr-font-family);
  --cr-font-h3: 500 24px/32px var(--cr-font-family);
  --cr-font-h4: 500 18px/26px var(--cr-font-family);
  --cr-font-h5: 500 16px/24px var(--cr-font-family);
  --cr-font-h6: 500 14px/22px var(--cr-font-family);
  --cr-font-body: 400 14px/22px var(--cr-font-family);
  --cr-font-caption: 400 12px/20px var(--cr-font-family);

  /* 容器 */
  --cr-bg: #FFFFFF;
  --cr-bg-secondary: #FAFAFA;
  --cr-border: #E7E7E7;
  --cr-page-margin: 96px;
}
```

---

## ConfigProvider 全局主题

在 App.vue 根组件中注入 CRDesign 主题，所有 antd-vue 组件自动遵循：

```vue
<script setup>
import { ConfigProvider } from 'ant-design-vue'
const theme = {
  token: {
    colorPrimary: '#F99D33',
    colorSuccess: '#4DAC39',
    colorWarning: '#F7BA1E',
    colorError: '#F53F3F',
    colorInfo: '#13A8A8',
    colorLink: '#13A8A8',
    colorLinkHover: '#36CFC9',
    colorTextBase: 'rgba(0, 0, 0, 0.9)',
    colorBgBase: '#FFFFFF',
    fontFamily: "'PingFang SC', system-ui, -apple-system, sans-serif",
    borderRadius: 4,
    borderRadiusSM: 2,
    borderRadiusLG: 8,
    fontSize: 14,
    fontSizeSM: 12,
    fontSizeLG: 16,
    fontSizeXL: 20,
    fontSizeHeading1: 36,
    fontSizeHeading2: 32,
    fontSizeHeading3: 24,
    fontSizeHeading4: 18,
    fontSizeHeading5: 16,
    lineHeight: 22,
    lineHeightLG: 24,
    controlHeight: 32,
    controlHeightLG: 40,
    controlHeightSM: 28,
    colorText: 'rgba(0, 0, 0, 0.9)',
    colorTextSecondary: 'rgba(0, 0, 0, 0.6)',
    colorTextTertiary: 'rgba(0, 0, 0, 0.4)',
    colorTextQuaternary: 'rgba(0, 0, 0, 0.25)',
    colorBgContainer: '#FFFFFF',
    colorBgElevated: '#FFFFFF',
    colorBgLayout: '#F5F5F5',
    colorBorder: '#E7E7E7',
    colorBorderSecondary: '#EEEEEE',
    colorFill: 'rgba(0, 0, 0, 0.15)',
    colorFillSecondary: 'rgba(0, 0, 0, 0.06)',
    colorFillTertiary: 'rgba(0, 0, 0, 0.04)',
    colorFillQuaternary: 'rgba(0, 0, 0, 0.02)',
    controlItemBgActive: '#FFF8E8',
    controlItemBgHover: '#FEEAC3',
    wireframe: false,
  },
  components: {
    Button: {
      colorPrimary: '#F99D33',
      colorPrimaryHover: '#FAB357',
      colorPrimaryActive: '#E67D00',
      defaultBorderColor: '#E7E7E7',
      defaultColor: 'rgba(0, 0, 0, 0.9)',
      borderRadius: 4,
    },
    Input: {
      colorBorder: '#DCDCDC',
      activeBorderColor: '#F99D33',
      hoverBorderColor: '#CACACA',
      borderRadius: 4,
    },
    Select: {
      colorBorder: '#DCDCDC',
      colorPrimary: '#F99D33',
      borderRadius: 4,
    },
    Table: {
      colorFillAlter: '#FAFAFA',
      headerBg: '#F5F5F5',
      headerColor: 'rgba(0, 0, 0, 0.9)',
      borderRadius: 4,
    },
    Tabs: {
      colorPrimary: '#F99D33',
      inkBarColor: '#F99D33',
      itemColor: 'rgba(0, 0, 0, 0.9)',
      itemHoverColor: '#F99D33',
    },
    Modal: {
      borderRadiusLG: 16,
    },
    Card: {
      borderRadiusLG: 8,
    },
    Form: {
      labelColor: 'rgba(0, 0, 0, 0.9)',
      labelFontSize: 14,
    },
    Radio: {
      colorPrimary: '#F99D33',
      dotSize: 6,
      radioSize: 16,
    },
    Tag: {
      borderRadiusSM: 2,
    },
    Menu: {
      itemSelectedColor: '#F99D33',
      itemSelectedBg: '#FFF8E8',
      itemHoverColor: '#F99D33',
      itemHoverBg: '#FFF8E8',
      subMenuItemSelectedColor: '#F99D33',
    },
    Steps: {
      colorPrimary: '#F99D33',
    },
    Pagination: {
      colorPrimary: '#F99D33',
    },
    DatePicker: {
      colorPrimary: '#F99D33',
      colorBorder: '#DCDCDC',
      activeBorderColor: '#F99D33',
      borderRadius: 4,
    },
    TimePicker: {
      colorPrimary: '#F99D33',
      colorBorder: '#DCDCDC',
      activeBorderColor: '#F99D33',
      borderRadius: 4,
    },
    Upload: {
      colorPrimary: '#F99D33',
    },
    Transfer: {
      colorPrimary: '#F99D33',
      colorBorder: '#E7E7E7',
    },
    TreeSelect: {
      colorPrimary: '#F99D33',
      colorBorder: '#DCDCDC',
      borderRadius: 4,
    },
    Cascader: {
      colorPrimary: '#F99D33',
      colorBorder: '#DCDCDC',
      borderRadius: 4,
    },
    AutoComplete: {
      colorPrimary: '#F99D33',
      colorBorder: '#DCDCDC',
      borderRadius: 4,
    },
    Slider: {
      colorPrimary: '#F99D33',
      trackBg: '#F5F5F5',
    },
    Rate: {
      colorPrimary: '#F99D33',
    },
    Progress: {
      colorPrimary: '#F99D33',
      remainingColor: '#F5F5F5',
    },
    Calendar: {
      colorPrimary: '#F99D33',
    },
    Timeline: {
      dotBg: '#F99D33',
    },
    Tree: {
      directoryNodeSelectedColor: '#F99D33',
      directoryNodeSelectedBg: '#FFF8E8',
    },
    Anchor: {
      colorPrimary: '#F99D33',
    },
    Breadcrumb: {
      colorPrimary: '#F99D33',
    },
    Dropdown: {
      borderRadiusLG: 8,
    },
    Popover: {
      borderRadiusLG: 8,
    },
    Tooltip: {
      borderRadiusLG: 4,
    },
    Drawer: {
      borderRadiusLG: 16,
    },
    Notification: {
      borderRadiusLG: 8,
    },
    Alert: {
      borderRadiusLG: 8,
    },
    FloatButton: {
      colorPrimary: '#F99D33',
    },
    Segmented: {
      colorPrimary: '#F99D33',
    },
    Tour: {
      colorPrimary: '#F99D33',
    },
  },
}
</script>

<template>
  <ConfigProvider :theme="theme">
    <RouterView />
  </ConfigProvider>
</template>
```

---

## 全量组件映射

以下按 antd-vue 官方分类，列出全部 68 个组件的 CRDesign 用法。

---

### 通用 General

#### Button 按钮 `<a-button>`

```vue
<a-button type="primary">主要按钮</a-button>
<a-button type="primary" ghost>次要按钮(品牌)</a-button>
<a-button>默认按钮</a-button>
<a-button type="dashed">虚线按钮</a-button>
<a-button type="text">文本按钮</a-button>
<a-button type="link">链接按钮</a-button>
<a-button type="primary" danger>危险按钮</a-button>
<a-button type="primary" size="large">大号 40px</a-button>
<a-button type="primary" size="small">小号 28px</a-button>
<a-button type="primary" :icon="h(PlusOutlined)">图标按钮</a-button>
<a-button type="primary" loading>加载中</a-button>
<a-button disabled>禁用</a-button>
<a-button type="primary" block>撑满容器</a-button>
```

| CRDesign 规格 | antd-vue Props |
|---|---|
| 主要按钮 | `type="primary"` |
| 次要按钮(品牌) | `type="primary" ghost` |
| 默认按钮(灰底) | `type="default"` 或省略 |
| 虚线按钮 | `type="dashed"` |
| 文本按钮 | `type="text"` |
| 链接按钮 | `type="link"` |
| 危险操作 | `danger` |
| 大/默认/小 | `size="large"/"middle"/"small"` |
| 图标 | `:icon="h(XxxOutlined)"` |
| 加载 | `loading` |
| 禁用 | `disabled` |
| 撑满 | `block` |

**禁止：** 手写 `<button>` 或 `<button class="...">`

#### Icon 图标 `<XxxIcon>`

```vue
<script setup>
import { PlusOutlined, SearchOutlined, DeleteOutlined, EditOutlined } from '@ant-design/icons-vue'
</script>
<template>
  <PlusOutlined />
  <SearchOutlined style="font-size: 16px; color: var(--cr-brand-6)" />
</template>
```

图标颜色通过 style 或 CSS 变量控制，使用 `--cr-brand-6` 等品牌色变量。

#### Typography 排版 `<a-typography>`

```vue
<a-typography-title :level="1">一级标题 36px</a-typography-title>
<a-typography-title :level="2">二级标题 32px</a-typography-title>
<a-typography-title :level="3">三级标题 24px</a-typography-title>
<a-typography-title :level="4">四级标题 18px</a-typography-title>
<a-typography-title :level="5">五级标题 16px</a-typography-title>
<a-typography-paragraph>正文段落 14px/22px</a-typography-paragraph>
<a-typography-text>普通文本</a-typography-text>
<a-typography-text type="secondary">次要文字 var(--cr-font-2)</a-typography-text>
<a-typography-text type="success">成功色 var(--cr-success-6)</a-typography-text>
<a-typography-text type="warning">警告色 var(--cr-warning-6)</a-typography-text>
<a-typography-text type="danger">错误色 var(--cr-error-6)</a-typography-text>
<a-typography-text disabled>禁用文字 var(--cr-font-4)</a-typography-text>
<a-typography-text code>代码</a-typography-text>
<a-typography-text mark>高亮标记</a-typography-text>
<a-typography-text strong>加粗</a-typography-text>
<a-typography-text underline>下划线</a-typography-text>
<a-typography-text delete>删除线</a-typography-text>
<a-typography-text copyable>可复制</a-typography-text>
<a-typography-text editable>可编辑</a-typography-text>
<a-typography-link href="https://example.com">链接 var(--cr-cyanblue-6)</a-typography-link>
```

---

### 布局 Layout

#### Layout 布局 `<a-layout>`

```vue
<a-layout>
  <a-layout-sider :width="240" theme="light">
    <!-- 侧边栏 -->
  </a-layout-sider>
  <a-layout>
    <a-layout-header style="background: var(--cr-bg); padding: 0 var(--cr-page-margin)">
      <!-- 顶部栏 -->
    </a-layout-header>
    <a-layout-content style="padding: 24px; background: var(--cr-bg-layout)">
      <!-- 内容区 -->
    </a-layout-content>
    <a-layout-footer>
      <!-- 页脚 -->
    </a-layout-footer>
  </a-layout>
</a-layout>
```

CRDesign 规范：页面边距 96px，内容区背景 `--cr-bg-layout` (#F5F5F5)，容器背景纯白 `--cr-bg`。

#### Grid 栅格 `<a-row>` / `<a-col>`

```vue
<a-row :gutter="[24, 16]">
  <a-col :span="8"><div>三栏</div></a-col>
  <a-col :span="8"><div>三栏</div></a-col>
  <a-col :span="8"><div>三栏</div></a-col>
</a-row>
<a-row :gutter="24">
  <a-col :xs="24" :sm="12" :md="8" :lg="6">响应式</a-col>
</a-row>
```

CRDesign 间距：gutter 推荐 24px，必须为 8 的倍数。

#### Space 间距 `<a-space>`

```vue
<a-space :size="8">
  <a-button type="primary">保存</a-button>
  <a-button>取消</a-button>
</a-space>
<a-space direction="vertical" :size="16">
  <div>纵向排列</div>
</a-space>
<a-space :size="8" wrap>自动换行</a-space>
```

CRDesign 间距规范：small=8px, middle=16px, large=24px。按钮组间距 8px。

#### Divider 分割线 `<a-divider>`

```vue
<a-divider />
<a-divider dashed />
<a-divider orientation="left">左侧标题分割</a-divider>
<a-divider type="vertical" />  <!-- 垂直分割线 -->
```

CRDesign：分割线颜色 `--cr-gray-3` (#EEEEEE)。

#### Flex 弹性布局 `<a-flex>`

```vue
<a-flex gap="16" align="center" justify="space-between">
  <div>左</div>
  <div>右</div>
</a-flex>
<a-flex vertical gap="8">
  <div>纵向排列</div>
</a-flex>
```

---

### 导航 Navigation

#### Menu 导航菜单 `<a-menu>`

```vue
<!-- 侧边导航 -->
<a-menu mode="inline" v-model:selectedKeys="selectedKeys" theme="light">
  <a-menu-item key="dashboard">
    <DashboardOutlined /><span>仪表盘</span>
  </a-menu-item>
  <a-sub-menu key="system">
    <template #title><SettingOutlined /><span>系统管理</span></template>
    <a-menu-item key="users">用户管理</a-menu-item>
    <a-menu-item key="roles">角色管理</a-menu-item>
  </a-sub-menu>
</a-menu>

<!-- 顶部导航 -->
<a-menu mode="horizontal" v-model:selectedKeys="selectedKeys">
  <a-menu-item key="home">首页</a-menu-item>
  <a-menu-item key="about">关于</a-menu-item>
</a-menu>
```

CRDesign：选中色 `--cr-brand-6`，选中背景 `--cr-brand-1`。

#### Breadcrumb 面包屑 `<a-breadcrumb>`

```vue
<a-breadcrumb>
  <a-breadcrumb-item><router-link to="/">首页</router-link></a-breadcrumb-item>
  <a-breadcrumb-item>系统管理</a-breadcrumb-item>
  <a-breadcrumb-item>用户管理</a-breadcrumb-item>
</a-breadcrumb>
```

#### Dropdown 下拉菜单 `<a-dropdown>`

```vue
<a-dropdown>
  <a-button>更多操作 <DownOutlined /></a-button>
  <template #overlay>
    <a-menu>
      <a-menu-item key="edit">编辑</a-menu-item>
      <a-menu-item key="delete" danger>删除</a-menu-item>
    </a-menu>
  </template>
</a-dropdown>
```

CRDesign：下拉菜单圆角 8px，阴影 `--cr-shadow-2`。

#### Pagination 分页 `<a-pagination>`

```vue
<a-pagination
  v-model:current="page"
  :total="total"
  :page-size="10"
  show-quick-jumper
  show-size-changer
  :show-total="(total, range) => `${range[0]}-${range[1]} / 共 ${total} 条`"
/>
```

CRDesign：选中页码背景 `--cr-brand-6`。

#### Steps 步骤条 `<a-steps>`

```vue
<a-steps :current="1">
  <a-step title="基本信息" description="填写基本信息" />
  <a-step title="详细配置" description="配置详细参数" />
  <a-step title="完成" description="确认并提交" />
</a-steps>
```

CRDesign：当前步骤色 `--cr-brand-6`，完成色 `--cr-success-6`。

#### Anchor 锚点 `<a-anchor>`

```vue
<a-anchor :offset-top="80">
  <a-anchor-link href="#basic" title="基础用法" />
  <a-anchor-link href="#advanced" title="高级用法" />
</a-anchor>
```

#### PageHeader 页头 `<a-page-header>`

```vue
<a-page-header
  title="用户管理"
  sub-title="管理系统用户"
  @back="() => $router.back()"
>
  <template #extra>
    <a-button type="primary">新增用户</a-button>
  </template>
</a-page-header>
```

---

### 数据录入 Data Entry

#### AutoComplete 自动补全 `<a-auto-complete>`

```vue
<a-auto-complete
  v-model:value="value"
  :options="options"
  placeholder="请输入关键词"
  style="width: 300px"
/>
```

#### Cascader 级联选择 `<a-cascader>`

```vue
<a-cascader v-model:value="value" :options="options" placeholder="请选择" change-on-select />
```

#### Checkbox 复选框 `<a-checkbox>`

```vue
<a-checkbox v-model:checked="checked">同意协议</a-checkbox>
<a-checkbox-group v-model:value="selected" :options="options" />
<a-checkbox indeterminate>半选</a-checkbox>
```

#### DatePicker 日期选择 `<a-date-picker>`

```vue
<a-date-picker v-model:value="date" placeholder="选择日期" />
<a-range-picker v-model:value="range" />
<a-week-picker v-model:value="week" />
<a-month-picker v-model:value="month" />
<a-quarter-picker v-model:value="quarter" />
<a-year-picker v-model:value="year" />
```

CRDesign：边框 `--cr-gray-5`，聚焦边框 `--cr-brand-6`，圆角 4px。

#### Form 表单 `<a-form>`

```vue
<a-form
  :model="form"
  :label-col="{ span: 6 }"
  :wrapper-col="{ span: 18 }"
  @finish="onSubmit"
>
  <a-form-item label="用户名" name="username" :rules="[{ required: true, message: '请输入' }]">
    <a-input v-model:value="form.username" />
  </a-form-item>
  <a-form-item label="邮箱" name="email" :rules="[{ type: 'email', message: '邮箱格式不正确' }]">
    <a-input v-model:value="form.email" />
  </a-form-item>
  <a-form-item label="角色" name="role">
    <a-select v-model:value="form.role" :options="roleOptions" />
  </a-form-item>
  <a-form-item label="生日" name="birthday">
    <a-date-picker v-model:value="form.birthday" style="width: 100%" />
  </a-form-item>
  <a-form-item label="备注" name="remark">
    <a-textarea v-model:value="form.remark" :rows="3" show-count :maxlength="200" />
  </a-form-item>
  <a-form-item :wrapper-col="{ offset: 6, span: 18 }">
    <a-space>
      <a-button type="primary" html-type="submit">提交</a-button>
      <a-button>取消</a-button>
    </a-space>
  </a-form-item>
</a-form>
```

布局对应：竖向（不设 label-col），横向右对齐（label-col span:6 wrapper-col span:18）。
表单项间距 24px，必填标记自动红色 `*`，错误色 `--cr-error-6`。

#### Input 输入框 `<a-input>`

```vue
<a-input v-model:value="val" placeholder="基础输入" />
<a-input v-model:value="val" size="large" placeholder="大号 40px" />
<a-input v-model:value="val" size="small" placeholder="小号 28px" />
<a-input v-model:value="val" allow-clear placeholder="可清除" />
<a-input-password v-model:value="pwd" placeholder="密码框" />
<a-input-search v-model:value="keyword" placeholder="搜索" enter-button />
<a-textarea v-model:value="text" :rows="4" show-count :maxlength="500" />
<a-input v-model:value="val" addon-before="Http://" addon-after=".com" />
<a-input v-model:value="val" prefix="￥" suffix="RMB" />
<a-input v-model:value="val" status="error" />
<a-input v-model:value="val" status="warning" />
<a-input v-model:value="val" disabled />
<a-input-number v-model:value="num" :min="0" :max="100" />
```

**禁止：** 手写 `<input>` 实现文本输入

#### InputNumber 数字输入 `<a-input-number>`

```vue
<a-input-number v-model:value="num" :min="0" :max="999" :step="1" />
<a-input-number v-model:value="num" :formatter="v => `$${v}`" :parser="v => v.replace('$', '')" />
```

#### Mentions 提及 `<a-mentions>`

```vue
<a-mentions v-model:value="text" :options="userOptions" placeholder="输入 @ 提及用户" />
```

#### Radio 单选 `<a-radio>`

```vue
<a-radio-group v-model:value="val">
  <a-radio :value="1">选项A</a-radio>
  <a-radio :value="2">选项B</a-radio>
</a-radio-group>
<!-- Radio Button 面性选项卡 -->
<a-radio-group v-model:value="val" option-type="button">
  <a-radio-button value="a">A</a-radio-button>
  <a-radio-button value="b">B</a-radio-button>
</a-radio-group>
<!-- Radio Button 线性 -->
<a-radio-group v-model:value="val" option-type="button" button-style="outline">
  <a-radio-button value="a">A</a-radio-button>
</a-radio-group>
```

CRDesign：选中色 `--cr-brand-6`，圆形 16px，内圆 6px，间距 16px。

#### Rate 评分 `<a-rate>`

```vue
<a-rate v-model:value="score" :count="5" allow-half />
<a-rate v-model:value="score" allow-clear character="A" />
```

CRDesign：选中色 `--cr-brand-6`。

#### Select 选择器 `<a-select>`

```vue
<a-select v-model:value="val" :options="options" placeholder="请选择" />
<a-select v-model:value="val" show-search :filter-option="filterOption" placeholder="可搜索" />
<a-select v-model:value="val" mode="multiple" placeholder="多选" />
<a-select v-model:value="val" mode="tags" placeholder="可创建标签" />
<a-select v-model:value="val" size="large" />
<a-select v-model:value="val" allow-clear />
<a-select v-model:value="val" loading />
```

#### Slider 滑动条 `<a-slider>`

```vue
<a-slider v-model:value="val" :min="0" :max="100" />
<a-slider v-model:value="range" range :min="0" :max="100" />
<a-slider v-model:value="val" :marks="{ 0: '低', 50: '中', 100: '高' }" />
```

CRDesign：轨道色 `--cr-brand-6`，轨道背景 `--cr-gray-2`。

#### Switch 开关 `<a-switch>`

```vue
<a-switch v-model:checked="enabled" />
<a-switch v-model:checked="val" checked-children="开" un-checked-children="关" />
<a-switch v-model:checked="val" loading />
<a-switch v-model:checked="val" disabled />
```

#### TimePicker 时间选择 `<a-time-picker>`

```vue
<a-time-picker v-model:value="time" format="HH:mm" placeholder="选择时间" />
<a-time-range-picker v-model:value="range" format="HH:mm" />
```

#### Transfer 穿梭框 `<a-transfer>`

```vue
<a-transfer
  v-model:target-keys="targetKeys"
  v-model:selected-keys="selectedKeys"
  :data-source="dataSource"
  :render="item => item.title"
  :titles="['可选', '已选']"
/>
```

#### TreeSelect 树选择 `<a-tree-select>`

```vue
<a-tree-select v-model:value="val" :tree-data="treeData" placeholder="请选择" tree-default-expand-all allow-clear />
```

#### Upload 上传 `<a-upload>`

```vue
<a-upload :action="uploadUrl" :headers="headers" @change="handleChange">
  <a-button type="primary"><UploadOutlined /> 点击上传</a-button>
</a-upload>
<!-- 拖拽上传 -->
<a-upload-dragger :action="uploadUrl">
  <p><InboxOutlined style="font-size: 48px; color: var(--cr-brand-6)" /></p>
  <p>点击或拖拽文件到此区域上传</p>
</a-upload-dragger>
<!-- 照片墙 -->
<a-upload :action="uploadUrl" list-type="picture-card">
  <div><PlusOutlined /><div>上传</div></div>
</a-upload>
```

---

### 数据展示 Data Display

#### Avatar 头像 `<a-avatar>`

```vue
<a-avatar :size="40">U</a-avatar>
<a-avatar :size="40" src="https://..." />
<a-avatar :size="40" :style="{ backgroundColor: 'var(--cr-brand-6)' }">U</a-avatar>
<a-avatar-group :max-count="3">
  <a-avatar>A</a-avatar>
  <a-avatar>B</a-avatar>
  <a-avatar>C</a-avatar>
</a-avatar-group>
```

#### Badge 徽标 `<a-badge>`

```vue
<a-badge count="5"><a-button>消息</a-button></a-badge>
<a-badge :count="count" :overflow-count="99"><a-button>通知</a-button></a-badge>
<a-badge dot><a-button>有新消息</a-button></a-badge>
<a-badge status="success" text="正常" />
<a-badge status="error" text="异常" />
<a-badge status="processing" text="进行中" />
<a-badge status="warning" text="警告" />
<a-badge status="default" text="默认" />
<a-badge ribbon text="NEW"><a-card>内容</a-card></a-badge>
```

#### Calendar 日历 `<a-calendar>`

```vue
<a-calendar v-model:value="date" />
```

CRDesign：选中日期背景 `--cr-brand-1`，选中色 `--cr-brand-6`。

#### Card 卡片 `<a-card>`

```vue
<a-card title="卡片标题" :bordered="false">
  <p>内容</p>
</a-card>
<a-card :bordered="false" hoverable>
  <a-card-meta title="标题" description="描述">
    <template #avatar><a-avatar>U</a-avatar></template>
  </a-card-meta>
</a-card>
<a-card :bordered="false" :tab-list="tabList" @tab-change="onTabChange">
  <p>带标签页的卡片</p>
</a-card>
```

CRDesign：无边框（:bordered="false"），圆角 8px。

#### Carousel 走马灯 `<a-carousel>`

```vue
<a-carousel autoplay :dots="true">
  <div><h3>1</h3></div>
  <div><h3>2</h3></div>
  <div><h3>3</h3></div>
</a-carousel>
```

CRDesign：指示点颜色 `--cr-brand-6`。

#### Collapse 折叠面板 `<a-collapse>`

```vue
<a-collapse v-model:activeKey="activeKeys">
  <a-collapse-panel key="1" header="面板一">
    <p>内容一</p>
  </a-collapse-panel>
  <a-collapse-panel key="2" header="面板二">
    <p>内容二</p>
  </a-collapse-panel>
</a-collapse>
```

CRDesign：展开箭头色 `--cr-brand-6`，边框 `--cr-gray-4`。

#### Comment 评论 `<a-comment>`

```vue
<a-comment author="用户名" avatar="/avatar.png" content="评论内容" datetime="2024-01-01">
  <template #actions><span>回复</span></template>
</a-comment>
```

#### Descriptions 描述列表 `<a-descriptions>`

```vue
<a-descriptions title="用户信息" bordered :column="2">
  <a-descriptions-item label="姓名">张三</a-descriptions-item>
  <a-descriptions-item label="手机">13800138000</a-descriptions-item>
  <a-descriptions-item label="邮箱">zhangsan@example.com</a-descriptions-item>
  <a-descriptions-item label="地址">北京市</a-descriptions-item>
</a-descriptions>
```

#### Empty 空状态 `<a-empty>`

```vue
<a-empty description="暂无数据" />
<a-empty :image="simpleImage">自定义空状态</a-empty>
```

#### Image 图片 `<a-image>`

```vue
<a-image :width="200" src="https://..." />
<a-image-preview-group>
  <a-image :width="200" src="1.jpg" />
  <a-image :width="200" src="2.jpg" />
</a-image-preview-group>
```

#### List 列表 `<a-list>`

```vue
<a-list :data-source="data" :pagination="{ pageSize: 10 }">
  <template #renderItem="{ item }">
    <a-list-item>
      <a-list-item-meta :title="item.title" :description="item.desc">
        <template #avatar><a-avatar>{{ item.title[0] }}</a-avatar></template>
      </a-list-item-meta>
      <template #actions>
        <a-button type="link" size="small">编辑</a-button>
        <a-button type="link" size="small" danger>删除</a-button>
      </template>
    </a-list-item>
  </template>
</a-list>
<a-list :grid="{ gutter: 24, column: 4 }" :data-source="data">
  <template #renderItem="{ item }"><a-card>{{ item.title }}</a-card></template>
</a-list>
```

#### Popover 气泡卡片 `<a-popover>`

```vue
<a-popover title="标题" trigger="hover">
  <template #content><p>内容</p></template>
  <a-button>悬浮触发</a-button>
</a-popover>
```

CRDesign：圆角 8px，阴影 `--cr-shadow-2`。

#### QRCode 二维码 `<a-qrcode>`

```vue
<a-qrcode value="https://example.com" :size="160" />
<a-qrcode value="https://example.com" status="expired" @refresh="refresh" />
```

#### Segmented 分段控制器 `<a-segmented>`

```vue
<a-segmented v-model:value="val" :options="['日', '周', '月', '年']" />
```

CRDesign：选中背景 `--cr-brand-1`，选中文字 `--cr-brand-7`。

#### Statistic 统计数值 `<a-statistic>`

```vue
<a-statistic title="活跃用户" :value="11280" />
<a-statistic title="增长率" :value="11.28" suffix="%" />
<a-statistic title="总销售额" :value="88846" prefix="￥" />
<a-statistic-countdown title="倒计时" :value="deadline" @finish="onFinish" />
```

#### Table 表格 `<a-table>`

```vue
const columns = [
  { title: '名称', dataIndex: 'name', key: 'name' },
  { title: '年龄', dataIndex: 'age', key: 'age', sorter: true },
  { title: '状态', dataIndex: 'status', key: 'status' },
  { title: '创建时间', dataIndex: 'createdAt', key: 'createdAt' },
  { title: '操作', key: 'action', width: 180, fixed: 'right' },
]

<a-table
  :columns="columns"
  :data-source="dataSource"
  :loading="loading"
  :scroll="{ x: 'max-content' }"
  :pagination="{ pageSize: 10, showTotal: t => `共 ${t} 条`, showSizeChanger: true }"
  row-key="id"
  :row-selection="{ selectedRowKeys, onChange: onSelectChange }"
>
  <template #bodyCell="{ column, record }">
    <template v-if="column.key === 'status'">
      <a-badge :status="record.status === 1 ? 'success' : 'default'" :text="record.statusText" />
    </template>
    <template v-if="column.key === 'action'">
      <a-space>
        <a-button type="link" size="small">编辑</a-button>
        <a-popconfirm title="确定删除？" @confirm="onDelete(record.id)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </a-space>
    </template>
  </template>
</a-table>
```

CRDesign：表头背景 `--cr-gray-2`，斑马纹 `--cr-gray-1`，边框 `--cr-gray-4`。

#### Tabs 标签页 `<a-tabs>`

```vue
<a-tabs v-model:activeKey="key">
  <a-tab-pane key="1" tab="标签一">内容一</a-tab-pane>
  <a-tab-pane key="2" tab="标签二">内容二</a-tab-pane>
</a-tabs>
<!-- 卡片式 -->
<a-tabs v-model:activeKey="key" type="card">
  <a-tab-pane key="1" tab="标签一" />
</a-tabs>
<!-- 可编辑 -->
<a-tabs v-model:activeKey="key" type="editable-card" @edit="onEdit">
  <a-tab-pane v-for="pane in panes" :key="pane.key" :tab="pane.title" :closable="pane.closable" />
</a-tabs>
```

CRDesign：选中文字 `--cr-brand-6`，底部指示条 `--cr-brand-6`。

#### Tag 标签 `<a-tag>`

```vue
<a-tag>默认</a-tag>
<a-tag color="orange">待处理</a-tag>
<a-tag color="green">已完成</a-tag>
<a-tag color="red">紧急</a-tag>
<a-tag color="blue">进行中</a-tag>
<a-tag color="cyan">信息</a-tag>
<a-tag color="purple">特殊</a-tag>
<a-tag closable @close="onClose">可关闭</a-tag>
<a-tag v-for="tag in tags" :key="tag" closable>{{ tag }}</a-tag>
<a-tag><a href="#">可链接</a></a-tag>
<a-checkable-tag :checked="checked" @change="onChange">可选标签</a-checkable-tag>
```

CRDesign 颜色映射：orange→brand, green→success, red→error, cyan→cyanblue。

#### Timeline 时间线 `<a-timeline>`

```vue
<a-timeline>
  <a-timeline-item color="green">创建项目 2024-01-01</a-timeline-item>
  <a-timeline-item color="blue">提交审核 2024-01-05</a-timeline-item>
  <a-timeline-item color="red">审核驳回 2024-01-08</a-timeline-item>
  <a-timeline-item color="gray">待处理</a-timeline-item>
</a-timeline>
```

CRDesign 颜色映射：green→success, red→error, blue→brand。

#### Tooltip 文字提示 `<a-tooltip>`

```vue
<a-tooltip title="提示文字">
  <a-button>悬浮查看</a-button>
</a-tooltip>
<a-tooltip :title="longText" placement="topLeft">
  <span>长文本截断...</span>
</a-tooltip>
```

CRDesign：圆角 4px。

#### Tour 漫游式引导 `<a-tour>`

```vue
<a-tour v-model:current="current" :steps="steps" />
```

CRDesign：引导按钮色 `--cr-brand-6`。

#### Tree 树形控件 `<a-tree>`

```vue
<a-tree
  :tree-data="treeData"
  v-model:selectedKeys="selectedKeys"
  v-model:expandedKeys="expandedKeys"
  show-icon
  :field-names="{ title: 'name', key: 'id' }"
/>
<!-- 可勾选 -->
<a-tree :tree-data="treeData" v-model:checkedKeys="checkedKeys" checkable />
<!-- 目录树 -->
<a-tree-directory :tree-data="treeData" />
<!-- 可拖拽 -->
<a-tree :tree-data="treeData" draggable @drop="onDrop" />
```

CRDesign：选中背景 `--cr-brand-1`，选中文字 `--cr-brand-7`。

---

### 反馈 Feedback

#### Alert 警告提示 `<a-alert>`

```vue
<a-alert message="成功提示" type="success" show-icon />
<a-alert message="信息提示" type="info" show-icon />
<a-alert message="警告提示" type="warning" show-icon />
<a-alert message="错误提示" type="error" show-icon />
<a-alert message="可关闭" type="warning" closable @close="onClose" />
<a-alert message="带描述" description="详细描述信息" type="info" show-icon />
<a-alert message="顶部公告" type="info" banner />
```

CRDesign：success→`--cr-success-6`, warning→`--cr-warning-6`, error→`--cr-error-6`, info→`--cr-cyanblue-6`。圆角 8px。

#### Drawer 抽屉 `<a-drawer>`

```vue
<a-drawer v-model:open="visible" title="抽屉标题" :width="480" placement="right">
  <p>内容</p>
  <template #footer>
    <a-space>
      <a-button @click="visible = false">取消</a-button>
      <a-button type="primary" @click="onOk">确定</a-button>
    </a-space>
  </template>
</a-drawer>
```

CRDesign：圆角 16px。

#### Message 全局提示 `message`

```vue
<script setup>
import { message } from 'ant-design-vue'
message.success('操作成功')
message.error('操作失败')
message.warning('警告信息')
message.info('提示信息')
message.loading('加载中...', 0)  // 需手动关闭
const hide = message.loading('加载中...', 0)
setTimeout(hide, 2500)
</script>
```

#### Modal 对话框 `<a-modal>`

```vue
<a-modal v-model:open="visible" title="对话框标题" @ok="handleOk" width="520px">
  <p>内容</p>
</a-modal>
<!-- 确认框 -->
<a-modal v-model:open="visible" title="确认" @ok="handleOk" :confirm-loading="loading">
  <p>确定要执行此操作吗？</p>
</a-modal>
<!-- 自定义底部 -->
<a-modal v-model:open="visible" title="自定义">
  <p>内容</p>
  <template #footer>
    <a-button @click="visible = false">取消</a-button>
    <a-button type="primary" @click="handleOk">确定</a-button>
  </template>
</a-modal>
<!-- 全屏 -->
<a-modal v-model:open="visible" title="全屏" width="100%" :style="{ top: 0 }" wrap-class-name="full-modal">
```

CRDesign：圆角 16px，阴影 `--cr-shadow-3`。

#### Notification 通知 `<a-notification>`

```vue
<script setup>
import { notification } from 'ant-design-vue'
notification.success({ message: '成功', description: '操作成功完成' })
notification.error({ message: '错误', description: '操作失败' })
notification.warning({ message: '警告', description: '请注意' })
notification.info({ message: '信息', description: '提示信息' })
notification.open({ message: '自定义', description: '内容', duration: 0, placement: 'bottomRight' })
</script>
```

CRDesign：圆角 8px，阴影 `--cr-shadow-2`。

#### Popconfirm 气泡确认 `<a-popconfirm>`

```vue
<a-popconfirm title="确定要删除吗？" @confirm="onDelete" ok-text="确定" cancel-text="取消">
  <a-button type="link" danger>删除</a-button>
</a-popconfirm>
<a-popconfirm title="确定执行？" @confirm="onConfirm" ok-button-props="{ danger: true }">
  <a-button danger>危险操作</a-button>
</a-popconfirm>
```

#### Progress 进度条 `<a-progress>`

```vue
<a-progress :percent="30" />
<a-progress :percent="100" status="success" />
<a-progress :percent="70" status="active" />
<a-progress :percent="50" status="exception" />
<a-progress type="circle" :percent="75" />
<a-progress type="dashboard" :percent="75" />
<a-progress :percent="60" :stroke-color="{ '0%': '#F99D33', '100%': '#FAB357' }" />
```

CRDesign：进度条色 `--cr-brand-6`，成功色 `--cr-success-6`，异常色 `--cr-error-6`。

#### Result 结果页 `<a-result>`

```vue
<a-result status="success" title="操作成功" sub-title="订单号: 2024010100001">
  <template #extra>
    <a-button type="primary">返回首页</a-button>
    <a-button>查看详情</a-button>
  </template>
</a-result>
<a-result status="error" title="提交失败" sub-title="请检查信息后重试">
  <template #extra><a-button type="primary">重新提交</a-button></template>
</a-result>
<a-result status="warning" title="警告" sub-title="存在风险" />
<a-result status="info" title="提示" sub-title="信息说明" />
<a-result status="404" title="404" sub-title="页面不存在" />
<a-result status="403" title="403" sub-title="没有权限" />
<a-result status="500" title="500" sub-title="服务器错误" />
```

#### Skeleton 骨架屏 `<a-skeleton>`

```vue
<a-skeleton :loading="loading" active>
  <div>实际内容</div>
</a-skeleton>
<a-skeleton avatar :paragraph="{ rows: 4 }" active />
<a-skeleton-input :style="{ width: '300px' }" active />
<a-skeleton-image />
<a-skeleton-button />
```

#### Spin 加载中 `<a-spin>`

```vue
<a-spin :spinning="loading">
  <a-table :columns="columns" :data-source="data" />
</a-spin>
<a-spin size="small" />
<a-spin size="large" />
<a-spin :indicator="indicator" />
<a-spin tip="加载中...">内容</a-spin>
```

---

### 其他 Other

#### Affix 固钉 `<a-affix>`

```vue
<a-affix :offset-top="80">
  <a-button type="primary">固定在顶部</a-button>
</a-affix>
<a-affix :offset-bottom="80">
  <a-button type="primary">固定在底部</a-button>
</a-affix>
```

#### ConfigProvider 全局配置 `<a-config-provider>`

已在上方"ConfigProvider 全局主题"章节详细说明。所有组件通过此注入 CRDesign token。

```vue
<a-config-provider :theme="theme" :locale="zhCN">
  <RouterView />
</a-config-provider>
```

#### FloatButton 悬浮按钮 `<a-float-button>`

```vue
<a-float-button :style="{ right: '24px' }" @click="onClick" />
<a-float-button-group trigger="click" :style="{ right: '24px' }">
  <a-float-button />
  <a-float-button-badge :count="12" />
</a-float-button-group>
```

CRDesign：按钮色 `--cr-brand-6`。

#### Watermark 水印 `<a-watermark>`

```vue
<a-watermark content="CRDesign">
  <div style="height: 500px">被水印保护的内容</div>
</a-watermark>
<a-watermark :content="['CRDesign', '内部文件']" :gap="[100, 100]">
  <div>多行水印</div>
</a-watermark>
```

#### App 应用级组件 `<a-app>`

```vue
<a-app>
  <RouterView />
</a-app>
```

包裹根组件，提供 message/notification/modal 的上下文。

---

## 颜色使用规则

- 色阶 1-2 → 背景填充（hover/选中态）
- 色阶 3-4 → 浅色元素
- 色阶 5-6 → 常规元素（主色区间）
- 色阶 7-10 → 深色文字或强调

## 排版系统

| 级别 | 字号 | 行高 | 字重 | 场景 |
|------|------|------|------|------|
| h1 | 36px | 44px | 500 | 页面主标题 |
| h2 | 32px | 40px | 500 | 模块标题 |
| h3 | 24px | 32px | 500 | 卡片标题 |
| h4 | 18px | 26px | 500 | 区域标题 |
| h5 | 16px | 24px | 500 | 列表标题 |
| h6 | 14px | 22px | 500 | 小标题 |
| body | 12px | 20px | 500 | 辅助标题 |
| caption | 10px | 18px | 500 | 标签 |

## 容器规范

- 背景色：纯白 `#FFFFFF`
- 边框：推荐无边框，或 `0.5px` 内描边 `#EEEEEE`
- 页面边距：`96px`

## 圆角规范

**必须使用以下值之一：** 2px, 4px, 6px, 8px, 12px, 16px, 24px

---

## 禁止事项

- **禁止** 手写 `<button>` 替代 `<a-button>`
- **禁止** 手写 `<input>` 替代 `<a-input>`
- **禁止** 手写 `<table>` 替代 `<a-table>`
- **禁止** 手写 `<select>` 替代 `<a-select>`
- **禁止** 手写 `<dialog>` 替代 `<a-modal>`
- **禁止** 手写手风琴/折叠效果替代 `<a-collapse>`
- **禁止** 手写轮播图替代 `<a-carousel>`
- **禁止** 手写下拉菜单替代 `<a-dropdown>`
- **禁止** 手写标签页替代 `<a-tabs>`
- **禁止** 手写进度条替代 `<a-progress>`
- **禁止** 手写树形控件替代 `<a-tree>`
- **禁止** 硬编码颜色值，必须通过 ConfigProvider 或 CSS 变量
- **禁止** 使用非规范中的圆角值（如 3px, 7px, 10px）
- **禁止** 使用非 PingFang SC / system-ui 的字体
- **禁止** 使用 antd 默认蓝色 `#1890ff` 作为主色，CRDesign 主色是 `#F99D33`
- **禁止** 引入 antd 样式后不做主题覆盖
