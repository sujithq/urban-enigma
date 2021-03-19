#!/bin/bash

dotnet publish
cd bin/Debug/net5.0/publish/
zip -r -D ../publish.zip .
cd ..
az webapp deployment source config-zip -g rg-ado2gh-local -n app-ado2gh-local --src ./publish.zip


