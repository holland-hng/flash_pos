if [ "$CONFIGURATION" == "Debug-production" ] || [ "$CONFIGURATION" == "Release-production" ]; then
  cp Runner/production/GoogleService-Info.plist Runner/GoogleService-Info.plist
elif [ "$CONFIGURATION" == "Debug-staging" ] || [ "$CONFIGURATION" == "Release-staging" ]; then
  cp Runner/staging/GoogleService-Info.plist Runner/GoogleService-Info.plist
fi

