#!/usr/bin/env bash
ps aux|grep java|grep beast-commdata-main|grep -v grep|awk '{print $2}'|xargs kill -9