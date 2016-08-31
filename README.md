# zzuthesis

郑州大学本科毕业设计(论文)和研究生学位论文(含 硕士和博士) LaTeX 模版。 本科毕业设计（论文）和研究生学位论文（含硕士和博士） 分别根据《郑州大学材料科学与工程学院本科毕业设计（论文）基本规范》和《郑州大学学位论文写作规范格式》的规范要求制定。该模板
主要完成于 2012 年上半年，在上传至 Github 前进行了部分调整，以保证正常编译运行。

## 字体配置

### Linux

将 `fonts/` 目录下所有字体拷贝至 `~/.fonts/` 目录下，运行 `fc-cache -fv` 即可。

### Windows
将 `fonts/` 目录下四种 Adobe 字体拷贝至 `C:\Windows\Fonts/` 目录下即可。

## 模板编译

### 模板文件的生成

  `xelatex main`
  
  `bibtex main`
  
  `xelatex main`
  
  `xelatex main`

### A3 封面文件的生成

  `xelatex spine`
  
  `xelatex a3cover`

为避免重复输入命令，模板中提供了自动运行脚本，其中 Linux 系统采用 Makefile：
* `make all`       等于 `make thesis && make a3cover`(默认选项)；
* `make thesis`    生成论文 main.pdf；
* `make a3cover`   生成封面 a3cover.pdf；
* `make clean`     清理中间文件；

Windows 系统则采用批处理脚本 msmake.cmd：
* `msmake thesis`    生成论文 main.pdf（默认选项）；
* `msmake a3cover`   生成封面 a3cover.pdf；
* `msmake clean`     清理中间文件；
