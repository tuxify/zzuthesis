@rem -*- mode: conf -*-
@rem ----------------------------------------------------------------------
@rem START OF FILE
@rem ----------------------------------------------------------------------
@rem 
@rem ----------------------------------------------------------------------
@rem COMMENTARY
@rem ----------------------------------------------------------------------
@rem
@rem 使用说明：
@rem
@rem 1.生成示例文档
@rem msmake [thesis|a3cover]
@rem 　　- thesis	生成 main.pdf，默认选项
@rem 　　- a3cover	生成 A3 封面
@rem
@rem 2.清理目录
@rem msmake clean
@rem 　　清理文档生成过程中产生的临时文件，仅保留 pdf 文件。
@rem 
@rem ----------------------------------------------------------------------
@rem ----------------------------------------------------------------------

@echo off
set Package=zzuthesis
set Method=xelatex
set Thesismain=main
if /i {%1}=={clean} goto clean
if /i {%1}=={a3cover} goto a3cover
goto thesis
:clean
@rem =============================================
@rem 清除文档生成过程中产生的临时文件
@rem =============================================
echo 删除文档生成过程中产生的临时文件
del /f /q spine.pdf *.log *.aux *.out *.thm *.bbl *.blg *.toc *.lot *.lof *.*~
del /f data\*.aux data\*.*~
goto end
:thesis
@rem =============================================
@rem 生成示例文档
@rem =============================================
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
set errmsg=bibtex
call bibtex %Thesismain%
if errorlevel 1 goto error
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
set errmsg=%Method%
call %Method% %Thesismain%
if errorlevel 1 goto error
goto end
:a3cover
@rem =============================================
@rem 生成 A3 封面
@rem =============================================
set errmsg=%Method%
call %Method% spine.tex
set Thesismain=spine
if errorlevel 1 goto error
call %Method% a3cover.tex
set Thesismain=a3cover
if errorlevel 1 goto error
goto end
@rem =============================================
@rem 示例文件生成过程中出错处理
@rem =============================================
:error
echo 使用%errmsg%生成%Thesismain%.pdf的过程中出错
:end
@rem =============================================
@rem 执行结束
@rem =============================================
@rem ----------------------------------------------------------------------
@rem END OF FILE
@rem ----------------------------------------------------------------------
