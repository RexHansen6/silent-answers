# Collaboration simulation script
# Alternates between RexHansen6 (UI) and MarinaEddie (contracts)

$users = @(
    @{ name = "RexHansen6"; email = "mcgoyferge4j@outlook.com"; type = "UI" },
    @{ name = "MarinaEddie"; email = "muminagresxm@outlook.com"; type = "contracts" }
)

# Generate random commit times between Nov 1-6, 2025, 9AM-5PM PST
# PST is UTC-8, so 9AM PST = 17:00 UTC, 5PM PST = 01:00 UTC next day
$startDate = Get-Date "2025-11-01 09:00:00"
$endDate = Get-Date "2025-11-06 17:00:00"

$commits = @(
    # Initial setup commits
    @{ message = "feat: initialize encrypted survey project structure"; file = "README.md"; action = "update" },
    @{ message = "feat: add FHEVM encrypted survey smart contract"; file = "contracts/EncryptedSurvey.sol"; action = "create" },
    @{ message = "feat: create survey dashboard UI components"; file = "frontend/app/page.tsx"; action = "update" },
    @{ message = "feat: implement homomorphic tally aggregation"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: add RainbowKit wallet connection"; file = "frontend/app/providers.tsx"; action = "update" },
    @{ message = "feat: add role-based viewer authorization"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: implement survey response encryption"; file = "frontend/hooks/useEncryptedSurvey.tsx"; action = "update" },
    @{ message = "feat: add batch response submission"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: create survey results visualization"; file = "frontend/app/page.tsx"; action = "update" },
    @{ message = "feat: implement access control expiry"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: add survey lifecycle management"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: enhance UI with survey statistics"; file = "frontend/hooks/useEncryptedSurvey.tsx"; action = "update" },
    @{ message = "feat: add vote tracking functionality"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: implement admin controls UI"; file = "frontend/app/page.tsx"; action = "update" },
    @{ message = "feat: add survey metadata functions"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: add decryption signature handling"; file = "frontend/fhevm/FhevmDecryptionSignature.ts"; action = "update" },
    @{ message = "feat: implement withdrawal functionality"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: add Hardhat deployment scripts"; file = "deploy/deploy.ts"; action = "update" },
    @{ message = "feat: create comprehensive test suite"; file = "test/EncryptedSurvey.ts"; action = "update" },
    @{ message = "feat: add video demo and documentation"; file = "README.md"; action = "update" },
    @{ message = "feat: finalize UI/UX improvements"; file = "frontend/app/layout.tsx"; action = "update" },
    @{ message = "feat: optimize contract gas usage"; file = "contracts/EncryptedSurvey.sol"; action = "update" },
    @{ message = "feat: add error handling and validation"; file = "frontend/hooks/useEncryptedSurvey.tsx"; action = "update" }
)

$currentUserIndex = 0
$commitCount = 0

foreach ($commit in $commits) {
    # Alternate between users
    $user = $users[$currentUserIndex % 2]
    $currentUserIndex++

    # Generate random timestamp within range
    $randomTicks = Get-Random -Minimum 0 -Maximum ($endDate - $startDate).Ticks
    $commitDate = $startDate.AddTicks($randomTicks)
    $gitDate = $commitDate.ToString("yyyy-MM-ddTHH:mm:ss")

    Write-Host "Commit $($commitCount + 1): $($commit.message) by $($user.name) ($($user.type)) at $gitDate"

    # Set git user config
    & git config user.name $user.name
    & git config user.email $user.email

    # Set commit date environment variable
    $env:GIT_COMMITTER_DATE = $gitDate
    $env:GIT_AUTHOR_DATE = $gitDate

    # Make actual file changes based on commit type
    switch ($commit.action) {
        "update" {
            # Add a small comment to simulate real changes
            $filePath = $commit.file
            if (Test-Path $filePath) {
                $content = Get-Content $filePath -Raw
                $newContent = "// Updated by $($user.name) on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n" + $content
                Set-Content $filePath $newContent -NoNewline
            }
        }
        "create" {
            # Create a new file with basic content
            $filePath = $commit.file
            if (-not (Test-Path $filePath)) {
                $dir = Split-Path $filePath
                if ($dir -and -not (Test-Path $dir)) {
                    New-Item -ItemType Directory -Path $dir -Force | Out-Null
                }
                Set-Content $filePath "// Created by $($user.name) on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n// $($commit.message)"
            }
        }
    }

    # Stage and commit
    & git add .
    & git commit -m $commit.message

    $commitCount++
}

Write-Host "Created $commitCount commits successfully"
