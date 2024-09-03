# Solidity 开发环境搭建指南

## 环境搭建

### 目标

- 设置开发环境以编写和部署 Solidity 合约。
- 使用 Foundry 工具链进行智能合约的开发、测试和部署。

### 内容

#### 1. 安装 Foundry

Foundry 是一个强大的以太坊开发工具包，用于编写、测试、调试和部署 Solidity 智能合约。

**安装步骤**：

- 在终端中运行以下命令来安装 Foundry：

  ```bash
  curl -L https://foundry.paradigm.xyz | bash
  foundryup
  ```

- 安装完成后，你可以通过以下命令验证安装：
  ```bash
  forge --version | bash
  ```
