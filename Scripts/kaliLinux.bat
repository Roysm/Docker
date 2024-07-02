@echo off
cls


set DockerBuildPath=<DockerFilePath>
set ImageName=mykali
set ContainerName=mykali


call :COLOR_PRINT "Executing: 'Docker images' command with "%ImageName%" Image Filter" "Yellow"
docker images | findstr /i %ImageName% > nul
if errorlevel 1 (
	call :COLOR_PRINT ""%ImageName%" image - not found!" "Red" && echo.
	call :COLOR_PRINT "Running Docker Build From '%DockerBuildPath%'" "Yellow"
	timeout 2
	start /wait "Docker Build" /D "%DockerBuildPath%" "%DockerBuildPath%\Build.bat"
	call :COLOR_PRINT "Image '%ImageName%' Succsesfuly Build" "Green"
) ELSE ( 
	call :COLOR_PRINT "Image '%ImageName%' Found" "Green"
	call :COLOR_PRINT "Checking if the old contianer - '%ContainerName%' running" "Yellow"
	docker container inspect %ContainerName% >nul 2>&1 && call :COLOR_PRINT "Old Container '%ContainerName%' - is running.. Executing docker stop to the '%ContainerName%' contianer" "Yellow" && docker stop %ContainerName% >nul && call :COLOR_PRINT "Old Container '%ContainerName%' - Stoped Succsesfuly" "Green"
)
call :COLOR_PRINT "Running Docker" "Yellow"
docker run -it --rm --name %ImageName% --hostname %ImageName% %ImageName%

EXIT 0


:COLOR_PRINT
set msg=%~1
set col=%~2
powershell "Write-Host $env:msg -ForegroundColor $env:col"
EXIT /B
