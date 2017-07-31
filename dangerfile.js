var checkOk = true

var diffSize = Math.max(danger.github.pr.additions, danger.github.pr.deletions);
if (diffSize > 5 ) {
    warn("This PR is too big. You should divide this PR into smaller PRs.");
    checkOk = false;
}

message("hello danger")
