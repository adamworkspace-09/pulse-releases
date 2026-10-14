@echo off
title Mise a jour de Pulse
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/adamworkspace-09/pulse-releases/main/update.ps1 | iex"
