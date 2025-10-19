#!/usr/bin/env bash

# 1️⃣ Grab all pending updates once
UPDATES=$(checkupdates)

# 2️⃣ Count how many packages are available
COUNT=$(printf '%s\n' "$UPDATES" | wc -l)

# 3️⃣ Escape backslashes and double quotes first
ESCAPED=${UPDATES//\\/\\\\}
ESCAPED=${ESCAPED//\"/\\\"}

# 4️⃣ Replace real newlines with the literal "\n"
ESCAPED=${ESCAPED//$'\n'/\\n}

# 5️⃣ Emit JSON
printf '{"text":"%s","tooltip":"<tt>%s</tt>"}\n' "$COUNT" "$ESCAPED"