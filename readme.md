# Robot Framework: A Comprehensive Guide 🚀

Welcome to the **Robot Framework** guide repository! Robot Framework is a powerful, flexible, and open-source automation framework designed to simplify testing and RPA (Robotic Process Automation). This repository serves as a resource hub for mastering Robot Framework.

---

## 📚 Table of Contents
- [Introduction](#-introduction)
- [Key Features](#-key-features)
- [Installation](#-installation)
- [Getting Started](#-getting-started)
- [Example Test Case](#-example-test-case)
- [Libraries and Resources](#-libraries-and-resources)
- [Robot Framework Launch Arguments](#%EF%B8%8F-robot-framework-launch-arguments)

---

## 🌟 Introduction

Robot Framework is a versatile tool used for both test automation and RPA. Its keyword-driven approach makes it beginner-friendly while retaining the flexibility to handle complex scenarios.

---

## 🔑 Key Features
- **Keyword-driven Testing:** Write reusable keywords for modular test cases.
- **Extensive Libraries:** Leverage built-in and third-party libraries.
- **Cross-platform:** Works seamlessly on Windows, macOS, and Linux.
- **Open-source:** Completely free and community-driven.

---
- ✅ Suite Setup & Teardown: Runs once before/after the entire test suite.
- ✅ Test Setup & Teardown: Runs before/after each test case.
- ✅ Tags: Assign labels to categorize and run test cases selectively.
- ✅ Documentation: Provides descriptions to improve readability and test management.

---

## 🛠️ Installation

Follow these steps to install Robot Framework:

1. Ensure Python is installed:
   ```bash
   python --version
   ```
2. Create a Virtual Environment and Active:
   ```bash
   python -m venv <ven_name>
   <ven_name>\Scripts\activate
   ```
2. Install Robot Framework:
   ```bash
   pip install robotframework
   ```
3. Verify the installation:
   ```bash
   robot --version
   ```

---

## 🚀 Getting Started

1. Create a test file:
   ```plaintext
   tests/
   ├── example_test.robot
   ```
2. Write your first test case:
   ```robot
   *** Settings ***
   Library    SeleniumLibrary

   *** Test Cases ***
   Open Google
       Open Browser    https://www.google.com    Chrome
       Page Should Contain    Google
       Close Browser
   ```
3. Run the test:
   ```bash
   robot tests/example_test.robot
   ```

---

## 🧪 Example Test Case

Here's an example of a simple login test:

```robot
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://example.com
${USERNAME}    user
${PASSWORD}    pass123

*** Test Cases ***
Login Test
    Open Browser    ${URL}    Chrome
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login
    Page Should Contain    Welcome
    Close Browser
```

---

## 📦 Libraries and Resources

- [Built-in Libraries](https://robotframework.org/robotframework/latest/libraries/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/)

---

## ⚙️ Robot Framework Launch Arguments

| Launch Argument                    | Description                                                              |
|-----------------------------------|--------------------------------------------------------------------------|
| `--headless`                      | Runs the browser in headless (invisible) mode                            |
| `--disable-gpu`                   | Disables GPU hardware acceleration (helps when running headless)         |
| `--window-size=1920,1080`         | Sets the browser window size (important in headless mode)                |
| `--no-sandbox`                    | Disables the sandbox, often required in CI environments like Docker      |
| `--disable-dev-shm-usage`         | Avoids shared memory issues in containers                                |
| `--incognito`                     | Opens the browser in incognito mode                                      |
| `--start-maximized`               | Starts the browser in maximized window                                   |
| `--disable-extensions`            | Disables Chrome extensions                                               |
| `--ignore-certificate-errors`     | Ignores certificate-related SSL errors                                   |

---
