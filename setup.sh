#!/bin/bash

# StackOverflow Users App - Setup Script
# This script sets up the project and runs it

echo "╔════════════════════════════════════════════════════════════════════════════════╗"
echo "║                 StackOverflow Users App - Setup Script                         ║"
echo "║                                                                                ║"
echo "║              Clean Architecture + DDD + BLoC (Production Ready)                ║"
echo "╚════════════════════════════════════════════════════════════════════════════════╝"

cd /Users/ziyadmansy/flutter_projects/oivan_task

echo ""
echo "📋 STEP 1: Installing dependencies..."
echo "═══════════════════════════════════════════════════════════════════════════════════"
flutter pub get
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "🔧 STEP 2: Generating code (Freezed, JSON, Hive)..."
echo "═══════════════════════════════════════════════════════════════════════════════════"
flutter pub run build_runner build --delete-conflicting-outputs
if [ $? -eq 0 ]; then
    echo "✅ Code generation completed successfully!"
else
    echo "❌ Code generation failed"
    exit 1
fi

echo ""
echo "📊 STEP 3: Running code analysis..."
echo "═══════════════════════════════════════════════════════════════════════════════════"
flutter analyze
if [ $? -eq 0 ]; then
    echo "✅ Code analysis passed!"
else
    echo "⚠️  Code analysis found issues (but app will still run)"
fi

echo ""
echo "🧪 STEP 4: Running unit tests..."
echo "═══════════════════════════════════════════════════════════════════════════════════"
flutter test test/unit/ --coverage
if [ $? -eq 0 ]; then
    echo "✅ All tests passed!"
else
    echo "⚠️  Some tests may have failed"
fi

echo ""
echo "🚀 STEP 5: Running the app..."
echo "═══════════════════════════════════════════════════════════════════════════════════"
echo ""
echo "Starting Flutter app..."
flutter run

echo ""
echo "═══════════════════════════════════════════════════════════════════════════════════"
echo "🎉 Setup complete! Your app is running!"
echo "═══════════════════════════════════════════════════════════════════════════════════"
