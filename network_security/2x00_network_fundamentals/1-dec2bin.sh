#!/bin/bash
echo "obase=2; $1" | bc | printf "%08d\n" $(cat)
