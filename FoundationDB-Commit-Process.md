# FoundationDB Commit Process

## Who can commit?

Anyone can make pull requests. Currently the FoundationDB team at Apple is controlling the list of contributors who can merge PRs. However, there are a few rules for these people:

## Rules for People with Merge-Rights

* Only merge PRs for which you are the assignee. The only exception to that is if the assignee does not have merge-rights and asks you to click the merge button.
* Only merge a PR if CI successfully finished. The only exception to that are changes that are expected to break CI (for example changes to docker containers). "This change is trivial" is not a valid reason to merge before CI is done!
* Never merge a draft PR. You can reach out to an author and ask them to make the PR a non-draft.
* You may merge your own PR as long as it has the required number of reviews (GitHub will enforce this). New changes to a PR will dismiss all existing reviews, so an approved PR can be safely merged under the assumption the reviewer(s) have seen all changes.
* A PR needs at least one approved review.

## Rules for PRs

* If a PR is not done done (code complete, test complete, and performance tested) it should be a draft PR. Only if the authors believe that the PR can be merged as is, it should be a non-draft PR.
* If the author wants reviewers to look at the code, the label RFC should be applied. If you’re assigned as a reviewer you should ignore draft PRs unless they have the RFC label attached to them
* If the author wants to talk about the change in our weekly meeting, the label needs-discussion should be applied.
* A PR that cherry-picks a change from a newer branch should include a title and description that describes the change being made. For example, instead of the title "Cherry-pick #XXXX", you could include the original PR title "Change feature X (release-X.Y)" and copy the original description. The PR description should include the original PR number so that readers know which PR is cherry-picked. Please refer to [PR#4677](https://github.com/apple/foundationdb/pull/4677) as an example.
* A PR should include links in the description to any issues that it is addressing or any PRs on other branches that it was cherry-picked from. 

## Code Review

* Never be offended if a PR is rejected by a reviewer!
* Doing a good job in a code review can save us (and our build cops!) a lot of trouble down the road. Please take this job seriously. If you're unsure whether a code-change has a high enough quality in order to be merged, it probably hasn't. You can use the points below as a check-list:

## Code Style
* **Variable and Function Names.** Do variable and function names make sense for what they mean / how they are used? Often during development the role of a variable or function can drift, a reviewer’s fresh perspective might notice confusing names more easily than the original developer.
* **Consider running git clang-format to format your changes.** In some cases, this can result in funny looking code as not all files are formatted correctly.

## Performance

* **Are all CPU-hot paths well optimized?** Try to look out for hot paths. Usually we don’t care as much about code that runs very rarely if it is not optimal. However, if you find anything new in a hot code path (for example the commitBatch function in the proxy), be extra careful and look for things that can be optimized.
* **STL containers.** Using STL containers is generally fine. However, for many containers we have specialized implementations and often they will perform better in FDB. For example: whenever you see a std::vector, check whether a VectorRef would make more sense in that context.
Check for new slow tasks. In simulation or in performance runs, check whether there are new trace lines of type SlowTask - these can be a problem and should be fixed as early as possible.

## Testing

* Is the code tested in Simulation? For all new introduced code there should be at least one simulation test that verifies that this code works as expected. In many cases existing tests will cover this already.
* Are new parameters and knobs tested properly. For knobs, please use BUGGIFY to test different values. For configuration parameters, make sure that the simulator tests different combinations of them.
* Were simulation tests run on this PR? Not all contributors have easy access to, or automatically run, a larger-than-one-ctest amount of correctness. In these cases, you can run it on either Apple or Snowflake architecture. Please don't rely on our nightlies to do this work for you. If the author doesn’t have access to Joshua (our internal testing infrastructure that allows us to run simulation tests at scale), someone from Apple or Snowflake should run this for them. Currently our CI only executes a smoke test, so unless your code is trivial (like fixing a typo), please run enough testing yourself or ask someone to do it for you.
* Are ASSERT, ASSERT_WE_THINK, and TEST appropriately and correctly used? Assertions about invariants are always nice to have. They can also be made simulation-only. Code paths that are required to have meaningful and good testing coverage should have a TEST() macro to ensure that they are actually tested.
* Does it make sense to have unit-tests? We don’t do too much unit-testing in fdb. But for some components it might still be worth adding unit tests (like new data structures)
* For bug fixes: is there a test that catches regressions? For bugs that we do not find in simulation, we should first try to write a test that reproduces the problem before fixing it.

## Development Process
* Every PR needs a description (title is *NOT* a description). The description has to describe what the change is doing and how it was tested (such as the correctness test’s result summary, perf test result).
* Instead of merging up, we’re cherry-picking down. So if you want a change in `release-6.3` you first need to make this change in `master` and then cherry-pick the change (if applicable).
* If a PR is made against a release-branch there must be a justification in the description (or a link to a GitHub issue).
* Every function/actor/class that has been touched needs to be documented. Currently there are no guidelines about how much documentation is needed so it’s mostly at the discretion of the author and the reviewers. But the minimum is one sentence per function/actor/class has to exist. Our code-documentation is quite bad and this is an attempt of gradually improving code quality.

Additionally the following two changes will be made in the near future:
* All PRs will need two reviewers (at least on release branches, for master there hasn’t been a decision yet).
* Each release branch will have an owner. The owner will keep track of changes made to a branch. Not all responsibilities have been defined yet, but this person will be able to revert changes if they cause problems or do not follow the process or simply are not properly documented.