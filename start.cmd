@echo off
TITLE TesseractPro server software for Minecraft: Pocket Edition
cd /d %~dp0

if exist bin\php\php.exe (
	set PHPRC=""
	set PHP_BINARY=bin\php\php.exe
) else (
	set PHP_BINARY=php
)

if exist TesseractPro*.phar (
	set TESSERACT_FILE=TesseractPro*.phar
) else (
	if exist TesseractPro.phar (
		set TESSERACT_FILE=TesseractPro.phar
	) else (
		if exist PocketMine-MP.phar (
			set TESSERACT_FILE=PocketMine-MP.phar
		) else (
			if exist src\pocketmine\PocketMine.php (
				set TESSERACT_FILE=src\pocketmine\PocketMine.php
			) else (
				echo "[ERROR] Couldn't find a valid TesseractPro installation."
				pause
				exit 8
			)
		)
	)
)

if exist bin\mintty.exe (
	start "" bin\mintty.exe -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="Consolas" -o FontHeight=10 -o CursorType=0 -o CursorBlinks=1 -h error -t "GenisysPro" -w max %PHP_BINARY% %TESSERACT_FILE% --enable-ansi %*
) else (
	%PHP_BINARY% -c bin\php %TESSERACT_FILE% %*
)
