#!/bin/sh
docker build -t rockpaperscissors .
docker run -d --name rockpaperscissors --restart always rockpaperscissors
