#!/bin/bash

niri msg action toggle-overview
killall -SIGUSR1 waybar
