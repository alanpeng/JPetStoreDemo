*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         182.140.210.214:8282
${BROWSER}        phantomjs
${REMOTE_URL}     http://USERNAME:ACCESS_KEY@182.140.210.214:4444/wd/hub
${DELAY}          0
${VALID USER}     j2ee
${VALID PASSWORD}  j2ee
${HOME_URL}       http://${SERVER}/jpetstore
${LOGIN_URL}      http://${SERVER}/jpetstore/actions/Account.action
${WELCOME_URL}    http://${SERVER}/jpetstore/actions/Catalog.action

*** Keywords ***
打开 ${browser} 浏览器并跳转到地址 ${url}
#   Open Browser    ${url}    ${browser}   None  ${REMOTE_URL}
   Open Browser    ${url}    ${browser}

打开浏览器到系统主页
   打开 ${BROWSER} 浏览器并跳转到地址 ${LOGIN_URL}
   Maximize Browser Window
   Set Selenium Speed    ${DELAY}
   验证系统主页应该被打开

跳转到登录页面
   Go To    ${LOGIN_URL}
   验证登录页面应该被打开

输入用户名
   [Arguments]    ${username}
   Input Text    username    ${username}

输入密码
   [Arguments]    ${password}
   Input Text    password    ${password}

点击登录
   Click Button    signon

验证系统主页应该被打开
   Title Should Be    JPetStore Demo

验证登录页面应该被打开
   Title Should Be    JPetStore Demo

验证系统登录失败并且显示错误信息 "${message}"
   Location Should Be    ${LOGIN_URL}
   Page Should Contain   ${message}


验证系统登录成功并且跳转到商店首页
   Location Should Be    ${WELCOME_URL}
   Title Should Be    JPetStore Demo
