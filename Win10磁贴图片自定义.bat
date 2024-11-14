@echo off
:: 设置UTF-8格式
chcp 65001 >nul

:: 设置目录路径为批处理文件所在路径
set folderPath=%~dp0

:: 创建image目录在批处理文件所在目录下
if not exist "%folderPath%image\" (
    mkdir "%folderPath%image"
)

:: 提示用户输入图片名称（不包括扩展名）
set /p imageName=请输入图片名称（不包括扩展名）：

:: 检查输入是否为空
if "%imageName%"=="" (
    echo 错误: 输入的图片名称不能为空!
    exit /b
)

:: 图片源路径，现在使用用户输入的图片名称
set sourceImage=D:\Learn\Win10citie\tubiao\%imageName%.png
set destinationImage150=%folderPath%image\%imageName%_150.png

:: 检查源图片是否存在
if not exist "%sourceImage%" (
    echo 错误: 指定的图片不存在!
    exit /b
)

:: 复制操作，并重命名目标文件为带有 _150 后缀的文件
xcopy "%sourceImage%" "%destinationImage150%" /Y /I

:: 检查复制是否成功
if errorlevel 1 (
    echo 错误: 图片复制失败!
    exit /b
) else (
    echo 图片 %imageName%_150.png 已成功复制到 %folderPath%image\
)

:: 提示用户输入图片名称（不包括扩展名）
set /p imageName=请输入图片名称（不包括扩展名）：

:: 检查输入是否为空
if "%imageName%"=="" (
    echo 错误: 输入的图片名称不能为空!
    exit /b
)

:: 图片源路径，现在使用用户输入的图片名称
set sourceImage=D:\Learn\Win10citie\tubiao\%imageName%.png
set destinationImage70=%folderPath%image\%imageName%_70.png

:: 检查源图片是否存在
if not exist "%sourceImage%" (
    echo 错误: 指定的图片不存在!
    exit /b
)

:: 复制操作，并重命名目标文件为带有 _70 后缀的文件
xcopy "%sourceImage%" "%destinationImage70%" /Y /I

:: 检查复制是否成功
if errorlevel 1 (
    echo 错误: 图片复制失败!
    exit /b
) else (
    echo 图片 %imageName%_70.png 已成功复制到 %folderPath%image\
)

set /p input=请输入字符或字符串：

:: 检查输入是否为空
if "%input%"=="" (
    echo 错误: 输入不能为空!
    exit /b
)

:: 创建 XML 文件，使用带有 _150 和 _70 后缀的图片名称
(
echo ^<Application xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>
echo     ^<VisualElements
echo         BackgroundColor="#4CAF50"
echo         ShowNameOnSquare150x150Logo="on"
echo         Square150x150Logo="image\%imageName%_150.png"
echo         Square70x70Logo="image\%imageName%_70.png"
echo         ForegroundText="dark" /^> ::light 和 dark
echo ^</Application^>
) > "%folderPath%%input%.VisualElementsManifest.xml"


:: 输出成功信息
echo %input%.VisualElementsManifest.xml 文件已创建成功
