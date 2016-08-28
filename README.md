# zzuthesis
郑州大学本科毕业设计(论文)和研究生学位论文(含 硕士和博士) LaTex 模版。

## Linux 字体配置
将 `fonts/` 目录下所有字体拷贝至 `~/.fonts/` 目录下，运行 `fc-cache -fv` 即可。

## Makefile 说明
* `make all`       等于 `make thesis && make a3cover`；
* `make thesis`    生成论文 main.pdf；
* `make a3cover`   生成封面 a3cover.pdf；
* `make clean`     清理中间文件；
