#!/bin/bash
# -------------------------------------------------------
# HOOK: Hemingway Style - No Fluff Enforcer
# -------------------------------------------------------

# 定义禁止的废话模式 (Regex)
FORBIDDEN_PATTERNS="In this function|I will now|Here is the code|This function will|As an AI"

# 1. 获取暂存区的文件 (只查代码)
FILES=$(git diff --cached --name-only | grep -E '\.(ts|js|py|md|rs|go)$')

if [ -z "$FILES" ]; then
    exit 0
fi

# 2. 扫描废话
VIOLATIONS=$(grep -E "$FORBIDDEN_PATTERNS" $FILES)

if [ ! -z "$VIOLATIONS" ]; then
    echo "==================================================" >&2
    echo "⛔️ [HEMINGWAY BLOCKER] META-TALK DETECTED" >&2
    echo "   You are committing 'Fluff' comments. Delete them." >&2
    echo "--------------------------------------------------" >&2
    echo "$VIOLATIONS" | head -n 5 >&2
    echo "..." >&2
    echo "==================================================" >&2
    
    # 强制退出，阻止 git commit 继续执行
    exit 1
fi

exit 0