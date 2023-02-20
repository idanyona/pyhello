@echo off
FOR /F "tokens=*" %%g IN ('type .\agent.pub') do (SET PUBKEY=%%g)
echo %PUBKEY%
docker compose up -d