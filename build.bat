@echo off
ECHO ----------------------------------------
echo Creating Build Folder
IF Exist _build\skin.bello rmdir _build\skin.bello /S /Q
md _build\skin.bello\media\

Echo .gitignore>>exclude.txt
Echo Thumbs.db>>exclude.txt
Echo Desktop.ini>>exclude.txt
Echo dsstdfx.bin>>exclude.txt
Echo build.bat>>exclude.txt
Echo exclude.txt>>exclude.txt

ECHO ----------------------------------------
ECHO Creating Main XBT File...
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input media -output _build\skin.bello\media\Textures.xbt

ECHO ----------------------------------------
ECHO Creating themes XBT Files...
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Blue/media -output _build\skin.bello\media\Blue.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Dark/media -output _build\skin.bello\media\Dark.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Green/media -output _build\skin.bello\media\Green.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Light/media -output _build\skin.bello\media\Light.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Orange/media -output _build\skin.bello\media\Orange.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Pink/media -output _build\skin.bello\media\Pink.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Red/media -output _build\skin.bello\media\Red.xbt
START /B /WAIT tools\TexturePacker\TexturePacker -dupecheck -input themes/Yellow/media -output _build\skin.bello\media\Yellow.xbt
ECHO ----------------------------------------
ECHO XBT Texture Files Created...
ECHO Building Skin Directory...

xcopy "720p" "_build\skin.bello\720p" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "colors" "_build\skin.bello\colors" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "extras" "_build\skin.bello\extras" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "fonts" "_build\skin.bello\fonts" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "language" "_build\skin.bello\language" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "sounds" "_build\skin.bello\sounds" /E /Q /I /Y /EXCLUDE:exclude.txt
xcopy "*.*" "_build\skin.bello" /Q /I /Y /EXCLUDE:exclude.txt

del exclude.txt
