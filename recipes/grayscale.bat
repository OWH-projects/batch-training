@echo off

for %%a in (*.jpg *.png *.bmp) do (
  echo %%a
  convert %%a -colorspace gray g-%%a
)