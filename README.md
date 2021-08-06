# Expected behavior

Element with `.allowsHitTesting(false).disabled(true)` should not swallow any user interactions.

# Actual behavior

Clicks at buttons might happen through the element, but all gestures are swallowed - user cannot scroll the underlying ScrollViews if the origin of touch begins in a red overlay rectangle.

# Where it happens

Everywhere I tried - iOS, WatchOS ...

# Video:

![Image of problem](swiftui-scrollview-fail.gif)

# Workaround

See branch `hacky-workaround-01` with a hack from https://stackoverflow.com/a/68448681/38729.

It works, but I have no idea about performance implications, and (main problem for me!) **it isn't applicable in WatchOS**.