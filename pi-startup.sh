
#!/bin/bash

# Family Dashboard Raspberry Pi Startup Script
# Make this file executable: chmod +x pi-startup.sh

echo "Starting Family Dashboard on Raspberry Pi..."

# Check Node.js version compatibility
NODE_VERSION=$(node --version | cut -d'v' -f2)
REQUIRED_VERSION="18.0.0"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "Warning: Node.js version $NODE_VERSION detected. Recommended: v18.x"
fi

# Set environment for production
export NODE_ENV=production
export PORT=5000

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Build the application
echo "Building application..."
npm run build

# Start the application
echo "Starting Family Dashboard on port 5000..."
npm start

# Keep the script running
wait
