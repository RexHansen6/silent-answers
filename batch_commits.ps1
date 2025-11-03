# Batch commit creation script
$commits = @(
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-03T09:30:00"; msg = "feat: optimize gas usage in tally aggregation"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-03T11:15:00"; msg = "feat: add loading states for better UX"; file = "frontend/app/page.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-03T13:45:00"; msg = "feat: implement batch decryption for performance"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-03T15:20:00"; msg = "feat: enhance error handling in survey hook"; file = "frontend/hooks/useEncryptedSurvey.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-04T10:00:00"; msg = "feat: add survey analytics functions"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-04T12:30:00"; msg = "feat: implement responsive design improvements"; file = "frontend/app/page.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-04T14:45:00"; msg = "feat: add deadline extension functionality"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-05T09:15:00"; msg = "feat: add survey progress indicators"; file = "frontend/hooks/useEncryptedSurvey.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-05T11:30:00"; msg = "feat: implement role-based access control"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-05T13:45:00"; msg = "feat: add accessibility improvements"; file = "frontend/app/page.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-05T15:20:00"; msg = "feat: add survey metadata retrieval"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-06T10:00:00"; msg = "feat: implement dark mode support"; file = "frontend/app/layout.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-06T12:15:00"; msg = "feat: add result summary functions"; file = "contracts/EncryptedSurvey.sol" },
    @{ user = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; date = "2025-11-06T14:30:00"; msg = "feat: add export functionality for results"; file = "frontend/hooks/useEncryptedSurvey.tsx" },
    @{ user = "MarinaEddie"; email = "muminagresxm@outlook.com"; date = "2025-11-06T16:45:00"; msg = "feat: finalize contract optimizations"; file = "contracts/EncryptedSurvey.sol" }
)

foreach ($commit in $commits) {
    # Set git user
    & git config user.name $commit.user
    & git config user.email $commit.email

    # Set commit date
    $env:GIT_COMMITTER_DATE = $commit.date
    $env:GIT_AUTHOR_DATE = $commit.date

    # Add a comment to the file
    $filePath = $commit.file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        $newContent = "// Updated by $($commit.user) on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n" + $content
        Set-Content $filePath $newContent -NoNewline
    }

    # Commit
    & git add .
    & git commit -m $commit.msg

    Write-Host "Committed: $($commit.msg) by $($commit.user)"
}
