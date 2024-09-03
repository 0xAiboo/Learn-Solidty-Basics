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

#### 2. 创建并初始化项目

使用 Foundry 初始化一个新的 Solidity 项目：

```bash
forge init 02-BuildFoundry
cd 02-BuildFoundry
```

这将会创建一个基本的项目结构，其中包括：

- `src/`: 用于存放 Solidity 源代码文件。
- `test/`: 用于存放测试代码文件。
- `lib/`: 用于存放外部库或依赖。

### 示例代码

下面是使用 Foundry 创建、编写、测试一个简单 Solidity 合约的步骤。

1. 在 `src/` 目录下创建一个新的 Solidity 文件，例如 `SimpleStorage.sol`。

````solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.25;

   contract SimpleStorage {
       uint256 public storedValue;

       function set(uint256 value) public {
           storedValue = value;
       }

       function get() public view returns (uint256) {
           return storedValue;
       }
   }
````
2.	在 test/ 目录下编写一个测试文件，例如 SimpleStorage.t.sol。

```solidity
  // SPDX-License-Identifier: MIT
  pragma solidity ^0.8.25;

  import "forge-std/Test.sol";
  import "../src/SimpleStorage.sol";

  contract SimpleStorageTest is Test {
      SimpleStorage public simpleStorage;

      function setUp() public {
          simpleStorage = new SimpleStorage();
      }

      function testSetAndGet() public {
          simpleStorage.set(42);
          assertEq(simpleStorage.get(), 42);
      }
  }
```

### 运行测试

在 Foundry 中，你可以使用 `forge test` 命令来运行智能合约的测试。通过添加不同级别的 `-v` 标志，可以控制输出的详细程度：

- `-v`: 显示测试失败的情况和测试结果摘要。
- `-vv`: 显示更多的测试运行信息，包括通过的测试和一些中间输出。
- `-vvv`: 显示测试的详细过程，包括合约函数调用的细节。
- `-vvvv`: 显示所有可能的调试信息，包括堆栈跟踪、EVM 级别的详细日志等。

#### 示例

运行基本的测试命令：

```bash
forge test
```
使用中等详细度运行测试：

```bash
forge test -vv
```
使用最高详细度运行测试：

```bash
forge test -vvvv
```
根据需要选择适合的详细程度来调试和分析你的智能合约测试结果。