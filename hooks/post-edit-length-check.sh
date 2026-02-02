#!/bin/bash
# -------------------------------------------------------
# HOOK: Hemingway Style - Length & Complexity Enforcer
# -------------------------------------------------------

FILE_PATH="$1"
MAX_LINES=200  # 文件最大行数 (强迫拆分文件)
WARN_LINES=50  # 理想函数长度 (作为警告线)

# 1. 检查文件是否存在
if [ ! -f "$FILE_PATH" ]; then
    exit 0
fi

# 2. 计算行数
TOTAL_LINES=$(wc -l < "$FILE_PATH" | tr -d ' ')

# 3. 执法逻辑 (Iceberg Principle)
if [ "$TOTAL_LINES" -gt "$MAX_LINES" ]; then
    echo "==================================================" >&2
    echo "❌ [HEMINGWAY VIOLATION] FILE TOO LONG" >&2
    echo "   File: $FILE_PATH" >&2
    echo "   Lines: $TOTAL_LINES (Limit: $MAX_LINES)" >&2
    echo "   ACTION: Refactor now. Split into smaller modules." >&2
    echo "==================================================" >&2
    # 返回非0状态码可以让 Claude 意识到出错了 (视具体配置而定)
    exit 1
fi

# 4. 简单的深度嵌套检查 (检测超过4层的缩进)
if grep -q "^\s\{16,\}" "$FILE_PATH"; then
    echo "⚠️  [HEMINGWAY WARNING] Deep nesting detected in $FILE_PATH." >&2
    echo "   Flatten your logic using Early Returns." >&2
fi

exit 0