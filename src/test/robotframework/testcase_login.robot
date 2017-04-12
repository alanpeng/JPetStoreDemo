*** Settings ***
Documentation     登录功能验证测试用例
 ...               valid_login.robot file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
使用合法账号j2ee与密码j2ee能够登录系统
    Given 浏览器跳转到登录界面
    When 用户 "j2ee" 使用密码 "j2ee" 登录到系统
    Then 验证系统登录成功并且跳转到商店首页

使用非法账号admin与密码admin不能登录到系统
    Given 浏览器跳转到登录界面
    When 用户 "admin" 使用密码 "admin" 登录到系统
    Then 验证系统登录失败并且显示错误信息 "Invalid username or password"

*** Keywords ***
浏览器跳转到登录界面
    打开浏览器到系统主页
    跳转到登录页面

用户 "${username}" 使用密码 "${password}" 登录到系统
    输入用户名    ${username}
    输入密码    ${password}
    点击登录
