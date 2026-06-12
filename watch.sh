#!/bin/bash

echo "👁️  Watching apexcoolingtech project: $(pwd)"
echo "   Auto-commit is ON — press Ctrl+C to stop"
echo ""

while true; do
    if ! git diff --quiet || ! git diff --staged --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
        echo "📝 Changes detected — waiting 5 seconds..."
        sleep 5
        
        git add .
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        git commit -m "Auto-deploy: $TIMESTAMP"
        
        echo "🚀 Pushing apexcoolingtech to GitHub..."
        git push origin main
        
        echo "✅ Pushed at $TIMESTAMP — Netlify building..."
        echo ""
    fi
    sleep 10
done