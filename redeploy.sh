#!/bin/bash

# Get the latest deployment and trigger redeploy
VERCEL_TOKEN="vcp_3VTB5jl5TL8xf5COyRfA0zHEjhPryYBLyGrxntRais3yWTidEH2tR8DI"
PROJECT_ID="etnaminihouse"

echo "Fetching latest deployment..."

# Get deployments
DEPLOYMENTS=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" \
  "https://api.vercel.com/v6/deployments?projectId=$PROJECT_ID&limit=1" 2>&1)

echo "Response: $DEPLOYMENTS"
