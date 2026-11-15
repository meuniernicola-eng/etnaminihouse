@echo off
echo.
echo =====================================
echo NESTPOD - Image Fix Redeploy
echo =====================================
echo.
echo Installing Vercel CLI...
call npm install -g vercel

echo.
echo Deploying to Vercel production...
echo.

cd /D C:\Users\nicl\nestpod-site

vercel --prod --token vcp_3VTB5jl5TL8xf5COyRfA0zHEjhPryYBLyGrxntRais3yWTidEH2tR8DI

echo.
echo =====================================
echo Deployment complete!
echo =====================================
echo.
echo Checking live site in 30 seconds...
timeout /t 30

echo.
echo Opening site in browser...
start https://etnaminihouse.vercel.app

echo.
echo Images should now display on your live site!
echo.

pause
